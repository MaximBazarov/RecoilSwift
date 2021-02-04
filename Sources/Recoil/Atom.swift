import Combine
import Foundation
import SwiftUI

public class Atom<T: Codable>: ObservableObject {

    public var value: T {
        get { _value }
        set { _value = newValue }
    }

    public init(initial: @escaping () -> T) {
        self.initial = initial
    }

    public let objectWillChange = ObservableObjectPublisher()

    private var initial: () -> T

    private lazy var _value: T = initial() {
        willSet {
            objectWillChange.send()
        }
    }
}
