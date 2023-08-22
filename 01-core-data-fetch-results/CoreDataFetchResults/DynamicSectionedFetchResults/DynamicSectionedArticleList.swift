//
//  DynamicSectionedArticleList.swift
//  CoreDataFetchResults
//
//  Created by Cubically.co on 22.08.2023.
//

import CoreData
import SwiftUI

struct DynamicSectionedArticleList: View {

    @SectionedFetchRequest<String, Article>(
        sectionIdentifier: \.dateAddedString,
        sortDescriptors: [],
        predicate: nil,
        animation: .default
    ) private var sections: SectionedFetchResults<String, Article>

    init(
        sectionIdentifier: KeyPath<Article, String> = \.dateAddedString,
        sortDescriptors: [SortDescriptor<Article>] = [],
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
