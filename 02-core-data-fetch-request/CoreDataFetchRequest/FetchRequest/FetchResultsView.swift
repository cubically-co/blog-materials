import CoreData
import SwiftUI

struct FetchRequestView: View {
    
    @FetchRequest<Article>(
        sortDescriptors: [],
        predicate: nil,
        animation: .default
    ) private var articles: FetchedResults<Article>
    
    var body: some View {
        List {
            ForEach(articles) { article in
                ArticleItemView(article: article)
            }
        }
    }
}

struct FetchRequestView_Previews: PreviewProvider {
    static var previews: some View {
        FetchRequestView()
    }
}
