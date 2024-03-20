//
//  ContentView.swift
//  SwiftDataInfiniteScrollingDemo
//
//  Created by Thongchai Subsaidee on 21/3/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var items: [Item] = []
    @State private var currentPage: Int = 0
    
    
    var body: some View {
        List(items) { item in
            Text(item.name)
                .onAppear(perform: {
                    fetchItemsIfNecessary(item: item)
                })
        }
        .onAppear {
            performFetch(currentPage: currentPage)
        }
    }
    
    private func fetchItemsIfNecessary(item: Item) {
        if let lastItem = items.last, lastItem == item {
            currentPage += 1
            // load more items
            performFetch(currentPage: currentPage)
        }
    }
    
    private func performFetch(currentPage: Int = 0) {
        var fetchDescriptor = FetchDescriptor<Item>()
        fetchDescriptor.fetchLimit = 20
        fetchDescriptor.fetchOffset = currentPage * 20
        fetchDescriptor.sortBy = [.init(\.name, order: .forward)]
        
        do{
            self.items += try context.fetch(fetchDescriptor)
        }catch{
            print(error)
        }
    }
}

#Preview { @MainActor in
    ContentView()
        .modelContainer(previewContainer)
}
