import Foundation

extension String {
    static func randomTitle() -> String {
        [
            "Core Data Basics",
            "How to design with SwiftUI",
            "Take SwiftUI animations to whole new level",
            "Did somebody say widgets on Apple Watch?",
            "What’s new with text and text interactions",
            "Demystify SwiftUI performance"

        ].randomElement()!
    }
}
