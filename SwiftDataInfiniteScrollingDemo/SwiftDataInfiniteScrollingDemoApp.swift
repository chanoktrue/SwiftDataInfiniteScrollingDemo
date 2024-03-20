//
//  SwiftDataInfiniteScrollingDemoApp.swift
//  SwiftDataInfiniteScrollingDemo
//
//  Created by Thongchai Subsaidee on 21/3/24.
//

import SwiftUI

@main
struct SwiftDataInfiniteScrollingDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(previewContainer)
        }
    }
}
