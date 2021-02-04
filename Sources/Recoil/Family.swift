import Foundation

public class Family<ID: Hashable, T: Codable> {

    public init(initial: @escaping () -> T) {
        self.initial = initial
    }

    /// Returns the atom for provided id **or creates a new one and returns
    /// - Parameter id: id to obtain the atom
    /// - Returns: Atom stored for the id or a new atom
    ///
    public func at(id: ID) -> Atom<T> {
        guard let atom = atoms[id] else {
            let atom = Atom(initial: initial)
            atoms[id] = atom
            return atom
        }
        return atom
    }

    private var atoms = [ID: Atom<T>]()
    private var initial: () -> T

}



