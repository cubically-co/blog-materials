import CoreData
import SwiftUI

struct DynamicSectionedFetchRequestView: View {

    @State private var sectionIdentifier: KeyPath<Article, String> = \.dateAddedString
    @State private var sortDescriptors: [SortDescriptor<Article>] = [SortDescriptor(\.dateAdded, order: .reverse)]

    var body: some View {
        VStack {
            HStack {
                Button("By Title") { 
                    sectionIdentifier = \.title
                    sortDescriptors = [SortDescriptor(\.title, order: .forward)]
                }
                Button("By Date") { 
                    sectionIdentifier = \.dateAddedString
                    sortDescriptors = [SortDescriptor(\.dateAdded, order: .reverse)]
                }
                Button("By Trending") {
                    sectionIdentifier = \.isTrendingString
                    sortDescriptors = [SortDescriptor(\.isTrending, order: .forward)]
                }
            }
            .buttonStyle(.borderedProminent)

            DynamicSectionedArticleList(
                sectionIdentifier: sectionIdentifier,
                sortDescriptors: sortDescriptors
            )
        }
    }
}

struct DynamicSectionedFetchRequestView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicSectionedFetchRequestView()
    }
}
