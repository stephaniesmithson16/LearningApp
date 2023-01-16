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
                CodeTextView()
                
                // MARK: Next lesson button
                // Show only if there is a next lesson
                if model.hasNextLesson() {
                    Button {
                        model.nextLesson()
                    } label: {
                        
                        ZStack {
                            RectangleCard(color: Color.green)
                                .frame(height: 65, alignment: .center)
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }
                else {
                    Button {
                        model.currentSelectedIndex = nil
                    } label: {
                        
                        ZStack {
                            RectangleCard(color: Color.green)
                                .frame(height: 65, alignment: .center)
                            Text("Complete")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }
                
            }
            .navigationBarTitle("\(lesson?.title ?? "")")
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
