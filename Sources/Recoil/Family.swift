import Foundation

public class Family<ID: Hashable, T: Codable> {

    private var atoms = [ID: Atom<ID, T>]()
    private var newID: () -> ID
    private var newAtom: () -> Atom<ID, T>

    public init(newID: @escaping () -> ID, newAtom: @escaping () -> Atom<ID, T>) {
        self.newID = newID
        self.newAtom = newAtom
    }
    
    public func append(value: T) -> ID {
        let id = newID()
        atoms[id] = Atom<ID, T>(value: value, id: id)
        return id
    }

    /// Returns the atom for provided id **or creates a new one and returns
    /// - Parameter id: id to obtain the atom
    /// - Returns: Atom stored for the id or a new atom
    ///
    public func at(id: ID) -> Atom<ID, T> {
        guard let atom = atoms[id] else {
            let atom = newAtom()
            let id = newID()
            atoms[id] = atom
            return atom
        }
        return atom
    }
}



