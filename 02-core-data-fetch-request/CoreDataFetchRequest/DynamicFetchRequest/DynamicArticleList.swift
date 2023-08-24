import CoreData
import SwiftUI

struct DynamicArticleList: View {

    @FetchRequest<Article>(
        sortDescriptors: [],
        predicate: nil,
        animation: .default
    ) private var articles: FetchedResults<Article>

    init(
        sortDescriptors: [SortDescriptor<Article>] = [],
        predicate: NSPredicate? = nil
    ) {
        self._articles = FetchRequest<Article>(
            sortDescriptors: sortDescriptors,
            predicate: predicate,
            animation: .default
        )
    }

    var body: some View {
        List {
            ForEach(articles) { article in
                ArticleItemView(article: article)
            }
        }
    }
}
