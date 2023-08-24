import CoreData

final class CoreDataStack {

    static let shared = CoreDataStack()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Model")

        #if DEBUG
        container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        setupMocks()
        #endif

        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load. Error: \(error.localizedDescription)")
            }
        }
    }

    private func setupMocks() {
        let article1 = Article(context: container.viewContext)
        article1.id = UUID().uuidString
        article1.title = "SectionedFetchRequest"
        article1.dateAdded = DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2023, month: 8, day: 22).date!
        article1.isTrending = true

        let article2 = Article(context: container.viewContext)
        article2.id = UUID().uuidString
        article2.title = "Why SwiftUI is great"
        article2.dateAdded = DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2023, month: 8, day: 17).date!
        article2.isTrending = false

        let article3 = Article(context: container.viewContext)
        article3.id = UUID().uuidString
        article3.title = "What happened at WWDC23"
        article3.dateAdded = DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2023, month: 8, day: 17).date!
        article3.isTrending = false

        let article4 = Article(context: container.viewContext)
        article4.id = UUID().uuidString
        article4.title = "Dynamic FetchRequest"
        article4.dateAdded = DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2023, month: 8, day: 17).date!
        article4.isTrending = true

        let article5 = Article(context: container.viewContext)
        article5.id = UUID().uuidString
        article5.title = "New WorkoutKit API"
        article5.dateAdded = DateComponents(calendar: .current, timeZone: .autoupdatingCurrent, year: 2023, month: 8, day: 14).date!
        article5.isTrending = false
    }
}
