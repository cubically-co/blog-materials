import SwiftUI

@main
struct CoreDataFetchRequestApp: App {

    @State private var stack = CoreDataStack.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, stack.container.viewContext)
        }
    }
}
