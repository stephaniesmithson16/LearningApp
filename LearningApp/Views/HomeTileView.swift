//
//  HomeTileView.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 10/1/22.
//

import SwiftUI

struct HomeTileView: View {
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.white)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                .shadow(radius: 5)
            
            HStack() {
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                    .padding(.horizontal, 10)
                    
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .bold()
                        .padding(.top, 10)
         
                    Text(description)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)

                    HStack {
                        Image(systemName: "text.book.closed")
                        Text(count)
                            .font(.caption)
                        
                        Image(systemName: "clock")
                        Text(time)
                            .font(.caption)
                    }.padding(.bottom, 10)
                        
                }
            }.padding(.horizontal, 12)
        }.padding([.horizontal, .top], 10)
    }
}

struct HomeTileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTileView(image: "swift", title: "Learn Swift", description: "Understand the fundamentals of the Swift programming language.", count: "10 Lessons   ", time: "3 Hours")
    }
}
