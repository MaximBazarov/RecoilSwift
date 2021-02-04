import SwiftUI
import Combine

@propertyWrapper
public struct MutableValue<T: Codable>: DynamicProperty {
    @ObservedObject private var source: Source<T>
    private var sink: (T) -> ()
    
    public init(_ atom: Atom<T>, file: String = #file, line: Int = #line) {
        print("ATOM<\(T.self)> sink into: \(file), Line: \(line)")
        self.source = Source(atom: atom)
        self.sink = { atom.value = $0 }
    }
    
    public init(_ mutableSelector: MutableSelector<T>) {
        self.source = Source(selector: mutableSelector.selector)
        self.sink = mutableSelector.update
    }
    
    public var wrappedValue: T {
        get { source.value }
        nonmutating set {
            sink(newValue)
        }
    }
    
    public var projectedValue: Binding<T> {
        Binding(
            get: { self.wrappedValue },
            set: sink
        )
    }
}
