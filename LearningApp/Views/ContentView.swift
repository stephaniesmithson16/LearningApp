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
            LazyVStack {
                
                // Confirm that current module is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        let lesson = model.currentModule!.content.lessons[index]
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 66, alignment: .center)
                         
                            HStack() {
                                Text(String(index + 1))
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Title")
                                    
                                }
                            }
                        }
                        
                    }
                }
            }
        }
    }
}
