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
    @NSManaged public var dateAdded: Date
    @NSManaged public var isTrending: Bool

    @objc var dateAddedString: String {
        dateAdded.formatted()
    }

    @objc var isTrendingString: String {
        isTrending.description
    }
}

extension Article: Identifiable {}
