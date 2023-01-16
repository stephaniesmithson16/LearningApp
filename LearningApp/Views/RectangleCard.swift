//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 1/16/23.
//

import SwiftUI

struct RectangleCard: View {
    
    var color = Color.white
    
    var body: some View {
        ZStack {
            Rectangle()
                .padding()
                .foregroundColor(color)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
