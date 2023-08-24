import CoreData

final class CoreDataStack {

    static let shared = CoreDataStack()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Model")

        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load. Error: \(error.localizedDescription)")
            }
        }
    }

    func save() {
        do {
            try container.viewContext.save()
        } catch {
            print("Core Data failed to save. Error: \(error.localizedDescription)")
        }
    }
}
