//
//  HomeView.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 9/29/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var content:ContentView
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
