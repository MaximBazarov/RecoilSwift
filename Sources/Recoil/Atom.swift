import Combine
import Foundation
import SwiftUI

public class Atom<T: Codable>: ObservableObject {

    @Published var value: T

    public init(value: T) {
        self.value = value
    }

}
