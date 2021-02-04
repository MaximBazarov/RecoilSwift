import Foundation

public class Family<ID: Hashable, T: Codable> {

    private var items = [ID: Atom<T>]()

    private var newID: () -> ID

    public init(newID: @escaping () -> ID ) {
        self.newID = newID
    }
    
    public func append(value: T) -> ID {
        let id = newID()
        items[id] = Atom<T>(value)
        return id
    }

    public func at(id: ID) -> Atom<T>? {
        guard let atom = items[id] else { return nil }
        return atom
    }
}



