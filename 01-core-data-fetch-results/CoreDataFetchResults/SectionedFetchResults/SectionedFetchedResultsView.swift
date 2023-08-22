//
//  SectionedFetchedResultsView.swift
//  CoreDataFetchResults
//
//  Created by Cubically.co on 22.08.2023.
//

import CoreData
import SwiftUI

struct SectionedFetchedResultsView: View {

    @SectionedFetchRequest<String, Article>(
        sectionIdentifier: \.dateAddedString,
        sortDescriptors: [SortDescriptor(\.dateAddedString, order: .forward)],
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

struct SectionedFetchedResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionedFetchedResultsView()
    }
}
