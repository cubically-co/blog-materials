import CoreData
import SwiftUI

struct SectionedFetchRequestView: View {

    @SectionedFetchRequest<String, Article>(
        sectionIdentifier: \.dateAddedString,
        sortDescriptors: [SortDescriptor(\.dateAdded, order: .reverse)],
        predicate: nil,
        animation: .default
    ) private var sections: SectionedFetchResults<String, Article>

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

struct SectionedFetchRequestView_Previews: PreviewProvider {
    static var previews: some View {
        SectionedFetchRequestView()
    }
}
