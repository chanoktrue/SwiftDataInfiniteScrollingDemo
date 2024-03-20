//
//  PreviewContainer.swift
//  SwiftDataInfiniteScrollingDemo
//
//  Created by Thongchai Subsaidee on 21/3/24.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do{
        let container = try ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for index in 1..<501 {
            let item = Item( name: "Item #\(index)")
            container.mainContext.insert(item)
        }
        
        return container
        
    }catch {
        fatalError("Failed to initialize the model container.")
    }
}()
