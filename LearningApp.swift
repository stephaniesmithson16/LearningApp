//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 9/29/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
