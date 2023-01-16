//
//  ContentView.swift
//  LearningApp
//
//  Created by Stephanie Smithson on 9/29/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData:Data?
    
    @Published var currentModule:Module?
    var currentModuleIndex = 0
    
    @Published var currentLesson:Lesson?
    var currentLessonIndex = 0
    
    @Published var lessonDescription = NSAttributedString()
    
    @Published var currentSelectedIndex:Int?
    
    init() {
        getLocalData()
    }
    
    // MARK: Get Local Data
    
    func getLocalData() {
        
        //get urls
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        //get json data from url
        do {
            let jsonData = try Data(contentsOf: jsonURL!)
            let decoder = JSONDecoder()
            
            do {
                //data found --> parse from json
                let modules = try decoder.decode([Module].self, from: jsonData)
                self.modules = modules
            }
            catch {
                print("Could not parse data from json")
            }
        }
        catch {
            print("Local data not found")
        }
        
        //get style data from url
        do {
            let sData = try Data(contentsOf: styleURL!)
            self.styleData = sData
        }
        catch {
            print("Style data not found")
        }
        
    }
    
    // MARK: Data Functions
    
    func setModule(_ moduleId:Int) {
        
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
    
    func setLesson(_ lessonId:Int) {
        // Check that the lesson exists in the module
        if lessonId < currentModule!.content.lessons.count {
            // Lesson exists -> set its index
            currentLessonIndex = lessonId
        }
        else {
            // Lesson does not exist -> reset to 0
            currentLessonIndex = 0
        }
        
        // Set the lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        // Set the lesson description
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson() {
        // Increment lesson
        currentLessonIndex += 1
        
        // Validate new lesson number exists in the module
        if(currentLessonIndex < currentModule!.content.lessons.count) {
            // Lesson exists -> set it to published property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            // Lesson exists -> update lesson description
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else {
            // Lesson does not exist -> reset index to 0
            currentLessonIndex = 0
            // Lesson does not exist -> clear published lesson data
            currentLesson = nil
        }
        
    }
    
    func hasNextLesson() -> Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    // MARK: Code Styling
    
    private func addStyling(_ htmlString:String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        // Add styling data
        if styleData != nil {
            data.append(styleData!)
        }
        
        // Add html data
        data.append(Data(htmlString.utf8))
        
        // Convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                // Set result to attributed string
                resultString = attributedString
        }
        
        // Return resulted attributed string
        return resultString
    }
}
