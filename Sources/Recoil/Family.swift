import Foundation

public class AtomFamily<ID: Hashable, T: Codable> {
    subscript(key: ID) -> Atom<T> {
        if atoms[key] == nil {
            atoms[key] = Atom { self.initial(key) }
        }
        return atoms[key]!
    }

    public init(initial: @escaping (ID) -> T) {
        self.initial = initial
    }

    private let initial: (ID) -> T
    private var atoms: [ID: Atom<T>] = [:]
}



