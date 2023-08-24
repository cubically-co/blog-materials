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
    case fetchRequest = "FetchRequest"
    case sectionedFetchRequest = "SectionedFetchRequest"
    case dynamicFetchRequest = "Dynamic FetchRequest"
    case dynamicSectionedFetchRequest = "Dynamic SectionedFetchRequest"
}

struct ContentView: View {

    @State private var pickerValue: PickerItem = .fetchRequest

    var body: some View {
        VStack {
            Picker("View", selection: $pickerValue) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue).tag(item)
                }
            }
            
            switch pickerValue {
            case .fetchRequest:
                FetchRequestView()
            case .sectionedFetchRequest:
                SectionedFetchRequestView()
            case .dynamicFetchRequest:
                DynamicFetchRequestView()
            case .dynamicSectionedFetchRequest:
                DynamicSectionedFetchRequestView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
