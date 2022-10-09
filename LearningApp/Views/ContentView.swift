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
        NavigationView {
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    
                    // Confirm that current module is set
                    if model.currentModule != nil {
                        ForEach(0..<model.currentModule!.content.lessons.count) { index in
                            NavigationLink {
                                ContentDetailView().onAppear {
                                    model.setLesson(index)
                                }
                            } label: {
                                ContentTileView(index: index)
                            }.accentColor(.black)
                        }
                    }
                }
            }
        }
    }
}
