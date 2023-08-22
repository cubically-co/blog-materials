//
//  DynamicFetchedResultsView.swift
//  CoreDataFetchResults
//
//  Created by Cubically.co on 22.08.2023.
//

import CoreData
import SwiftUI

struct DynamicFetchedResultsView: View {

    @State private var sortDescriptor: SortDescriptor<Article> = SortDescriptor(\.dateAdded, order: .forward)

    var body: some View {
        VStack {
            HStack {
                Button("By Title") { sortDescriptor = SortDescriptor(\.title, order: .forward) }
                Button("By Date") { sortDescriptor = SortDescriptor(\.dateAdded, order: .reverse) }
                Button("By Trending") { sortDescriptor = SortDescriptor(\.isTrending, order: .reverse) }
            }
            .buttonStyle(.borderedProminent)

            DynamicArticleList(sortDescriptors: [sortDescriptor])
        }
    }
}

struct DynamicFetchedResultsView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFetchedResultsView()
    }
}
