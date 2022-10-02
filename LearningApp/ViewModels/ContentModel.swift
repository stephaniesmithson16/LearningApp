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
    
    init() {
        getLocalData()
    }
    
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
    
    func setModule(_ moduleId:Int) {
        
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
}
