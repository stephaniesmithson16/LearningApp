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
     
        if url != nil {
            VideoPlayer(player: AVPlayer(url: url!))
        }
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
