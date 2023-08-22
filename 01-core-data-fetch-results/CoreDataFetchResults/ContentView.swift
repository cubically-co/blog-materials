//
//  ContentView.swift
//  CoreDataFetchResults
//
//  Created by Cubically.co on 22.08.2023.
//

import SwiftUI

struct ArticleItemView: View {

    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(article.title)
            HStack {
                Text(article.dateAdded.formatted())
                Spacer()
                Text(article.isTrending ? "Trending" : "")
            }
            .font(.caption)
            .foregroundColor(.black.opacity(0.5))
        }
    }
}

enum PickerItem: String, CaseIterable {
    case fetchedResults = "FetchedResults"
    case sectionedFetchedResults = "SectionedFetchedResults"
    case dynamicFetchedResults = "Dynamic FetchedResults"
    case dynamicSectionedFetchedResults = "Dynamic SectionedFetchedResults"
}

struct ContentView: View {

    @State private var pickerValue: PickerItem = .fetchedResults

    var body: some View {
        VStack {
            Picker("View", selection: $pickerValue) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue).tag(item)
                }
            }
            
            switch pickerValue {
            case .fetchedResults:
                FetchResultsView()
            case .sectionedFetchedResults:
                SectionedFetchedResultsView()
            case .dynamicFetchedResults:
                DynamicFetchedResultsView()
            case .dynamicSectionedFetchedResults:
                DynamicSectionedFetchedResultsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
