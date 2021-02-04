import Foundation

public class Family<ID: Hashable, T: Codable> {

    private var items = [ID: Atom<T>]()
    
    public init() {
    }
    
    public func append(id: ID, value: () -> T) {
        let atom = Atom { value() }
        items[id] = atom
    }
    
    public func at(id: ID) -> Atom<T>? {
        guard let atom = items[id] else {
            return nil
        }
        
        return atom
    }
}



