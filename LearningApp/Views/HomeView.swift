//
//  HomeView.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 9/29/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var content:ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("What do you want to learn today?")
                    .padding([.leading])
                
                ScrollView {
                    
                    LazyVStack {
                        
                        
                        ForEach(content.modules) { module in
                            
                            VStack() {
                                
                                // MARK: Lesson Tile
                                HomeTileView(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons   " , time: module.content.time)
                                
                                // MARK: Test Tile
                                HomeTileView(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions   " , time: module.test.time)
                            }
                            
                        }
                        
                    }.navigationTitle("Get Started")
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
