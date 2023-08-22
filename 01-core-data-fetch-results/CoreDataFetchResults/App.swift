//
//  CoreDataFetchResultsApp.swift
//  CoreDataFetchResults
//
//  Created by Cubically.co on 22.08.2023.
//

import SwiftUI

@main
struct CoreDataFetchResultsApp: App {

    @State private var stack = CoreDataStack.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, stack.container.viewContext)
        }
    }
}
