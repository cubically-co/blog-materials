import CoreData
import SwiftUI

struct DynamicSectionedArticleList: View {

    @SectionedFetchRequest<String, Article>(
        sectionIdentifier: \.dateAddedString,
        sortDescriptors: [SortDescriptor(\.dateAdded, order: .reverse)],
        predicate: nil,
        animation: .default
    ) private var sections: SectionedFetchResults<String, Article>

    init(
        sectionIdentifier: KeyPath<Article, String> = \.dateAddedString,
        sortDescriptors: [SortDescriptor<Article>] = [SortDescriptor(\.dateAdded, order: .reverse)],
        predicate: NSPredicate? = nil
    ) {
        self._sections = SectionedFetchRequest<String, Article>(
            sectionIdentifier: sectionIdentifier,
            sortDescriptors: sortDescriptors,
            predicate: predicate,
            animation: .default
        )
    }

    var body: some View {
        List {
            ForEach(sections) { articles in
                Section(articles.id) {
                    ForEach(articles) { article in
                        ArticleItemView(article: article)
                    }
                }
            }
        }
    }
}
