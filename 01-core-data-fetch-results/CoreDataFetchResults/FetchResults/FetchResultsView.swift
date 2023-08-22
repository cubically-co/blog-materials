//
//  FetchResultsView.swift
//  CoreDataFetchResults
//
//  Created by Cubically.co on 22.08.2023.
//

import CoreData
import SwiftUI

struct FetchResultsView: View {
    
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

struct FetchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        FetchResultsView()
    }
}
