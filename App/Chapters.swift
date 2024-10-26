//
//  Chapters.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/8/24.
//

import Foundation
import SwiftUI

class Chapter: Identifiable, Codable {
    var isbn: Int = 0             //ISBN are different after 2007
    var totalChapters: Int = 10   //HARD CODED VALUE FOR TESTING PURPOSE
    var url: String = "Manga URL" //shonenjumpplus.com/episode/[NUMBER HERE]
    var totalViews: Int = 100
    var totalComments: Int = 250
    
    init() {
    }
    
    static let example = Chapter()
}

class Chapters: ObservableObject {
    static let saveKey = "SaveData"
    
    var chapter = Chapter()
    var chapter2 = Chapter()
    var chapter3 = Chapter()
    var chapter4 = Chapter()
    @Published private(set) var shelf: [Chapter] 
    
    init() {
        shelf = []
        shelf.append(chapter)
        shelf.append(chapter2)
        shelf.append(chapter3)
        shelf.append(chapter4)
        
        if let data = loadFile() {
            if let decoded = try? JSONDecoder().decode([Chapter].self, from: data) {
                shelf = decoded
                return
            }
        }
    }
    
    func addshelf(_ chaper: Chapter) {
        shelf.append(chapter)
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(shelf) {
            saveFile(data: encoded)
        }
    }
    
    private func saveFile(data: Data) {
        let url = getDocumentDirectory().appendingPathComponent(Self.saveKey)
        
        do {
            try data.write(to: url, options: [.atomicWrite, .completeFileProtection])
        } catch let error {
            print("Could not save file: " + error.localizedDescription)
        }
    }
    
    private func loadFile() -> Data? {
        let url = getDocumentDirectory().appendingPathComponent(Self.saveKey)
        
        if let data = try? Data(contentsOf: url) {
            return data
        }
        
        return nil
    }
    
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}


