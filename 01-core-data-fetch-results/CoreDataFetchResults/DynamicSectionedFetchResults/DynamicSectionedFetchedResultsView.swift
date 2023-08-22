//
//  DynamicSectionedFetchedResultsView.swift
//  CoreDataFetchResults
//
//  Created by Cubically.co on 22.08.2023.
//

import CoreData
import SwiftUI

struct DynamicSectionedFetchedResultsView: View {

    @State private var sectionIdentifier: KeyPath<Article, String> = \.dateAddedString

    var body: some View {
        VStack {
            HStack {
                Button("By Title") { sectionIdentifier = \.title }
                Button("By Date") { sectionIdentifier = \.dateAddedString }
                Button("By Trending") { sectionIdentifier = \.isTrendingString }
            }
            .buttonStyle(.borderedProminent)

            DynamicSectionedArticleList(sectionIdentifier: sectionIdentifier)
        }
    }
}

struct DynamicSectionedFetchedResultsView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicSectionedFetchedResultsView()
    }
}
