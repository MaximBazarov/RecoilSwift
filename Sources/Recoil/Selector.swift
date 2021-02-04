import Combine
import Foundation

public class Selector<T>: ObservableObject {
    public let objectWillChange = ObservableObjectPublisher()
    private let getValue: () -> T
    
    var value: T { getValue() }
    
    public init(get: @escaping (Getter) -> T) {
        let getter = Getter(sink: objectWillChange.send)
        
        getValue = {
            getter.dependencies = [:]
            return get(getter)
        }
    }
}

public class Getter {
    private let sink: () -> ()
    fileprivate var dependencies = [UUID: AnyCancellable]()
    
    init(sink: @escaping () -> ()) {
        self.sink = sink
    }
    
    public func callAsFunction<T>(_ atom: Atom<T>) -> T {
        dependencies[atom.id] = atom.objectWillChange.sink {
            self.sink()
        }
        
        return atom.value
    }
}
