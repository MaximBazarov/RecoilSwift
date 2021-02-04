import Combine
import Foundation
import SwiftUI

public class Atom<ID: Hashable, T: Codable>: ObservableObject {

    @Published var value: T

    public let id: ID

    public init(value: T, id: ID) {
        self.value = value
        self.id = id
    }

}
