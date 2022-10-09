//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 10/2/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostURL + (lesson?.video ?? ""))
     
        GeometryReader { geo in
        VStack {
            // Only show video if we have valid url
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
         
            // TODO: Lesson description
            
            // MARK: Next lesson button
            // Show only if there is a next lesson
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack {
                        Rectangle()
                            .frame(width: geo.size.width - 60, height: 24, alignment: .center)
                            .padding()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            }

        }
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
