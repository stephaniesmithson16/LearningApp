//
//  ContentTileView.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 10/2/22.
//

import SwiftUI

struct ContentTileView: View {
    @EnvironmentObject var model:ContentModel
    var index:Int
    
    var body: some View {
        
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
