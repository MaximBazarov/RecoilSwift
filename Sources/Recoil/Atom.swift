import Combine
import Foundation
import SwiftUI

public class Atom<T: Codable>: ObservableObject {

    public let id = UUID()
    
    public init(initial: () -> T) {
        self.value = initial()
    }
    
    @Published public var value: T
}
