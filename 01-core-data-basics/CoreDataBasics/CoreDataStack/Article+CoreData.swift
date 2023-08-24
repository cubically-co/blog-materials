import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {}

extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var date: Date
    @NSManaged public var isTrending: Bool
}

extension Article: Identifiable {}

extension Article {
    static func create(_ title: String) {
        let article = Article(context: CoreDataStack.shared.container.viewContext)
        article.id = UUID().uuidString
        article.title = title
        article.date = .now
        article.isTrending = .random()

        CoreDataStack.shared.save()
    }

    func update() {
        self.date = .now

        CoreDataStack.shared.save()
    }

    func delete() {
        CoreDataStack.shared.container.viewContext.delete(self)
        CoreDataStack.shared.save()
    }
}
