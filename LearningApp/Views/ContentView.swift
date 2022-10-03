//
//  ContentView.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 10/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading) {
                
                // Confirm that current module is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        ContentTileView(index: index)
                        
                    }
                }
                else {
                    Text("404 Not Found")
                }
            }
        }
    }
}
