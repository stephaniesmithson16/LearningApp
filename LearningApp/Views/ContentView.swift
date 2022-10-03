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
                        
                        let lesson = model.currentModule!.content.lessons[index]
                        
                        ZStack(alignment: .leading) {
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 66, alignment: .center)
                         
                            HStack(spacing: 30) {
                                Text(String(index + 1)).bold()
                                    .padding(.leading, 20)
                                VStack(alignment: .leading) {
                                    Text(lesson.title)
                                        .bold()
                                    Text(lesson.duration)
                                }
                            }
                        }.padding(.horizontal, 20)
                        
                    }
                }
                else {
                    Text("404 Not Found")
                }
            }
        }
    }
}
