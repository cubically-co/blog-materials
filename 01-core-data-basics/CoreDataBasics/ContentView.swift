import CoreData
import SwiftUI

struct ContentView: View {

    @FetchRequest<Article>(
        sortDescriptors: [SortDescriptor(\.date, order: .reverse)],
        predicate: nil,
        animation: .default
    ) private var articles: FetchedResults<Article>

    var body: some View {
        NavigationStack {
            List {
                ForEach(articles) { article in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(article.title)
                        Text(article.date.formatted(date: .abbreviated, time: .complete))
                            .font(.caption)
                            .opacity(0.7)
                    }
                    .onTapGesture { article.update() }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Articles")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("+") { Article.create(.randomTitle()) }
                }
            }
        }
    }

    private func delete(_ indexSet: IndexSet) {
        for index in indexSet {
            articles[index].delete()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
