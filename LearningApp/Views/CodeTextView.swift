//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 10/10/22.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.text = "Test Description"
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        // Set attributed text for lesson
        textView.attributedText = model.lessonDescription
        
        // Scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}
