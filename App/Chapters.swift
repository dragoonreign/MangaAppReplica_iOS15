//
//  Chapters.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/8/24.
//

import Foundation
import SwiftUI

class Chapter: Identifiable, Codable {
    var isbn: Int = 0             //identifiable
    var totalChapters: Int = 10   //HARD CODED VALUE FOR TESTING PURPOSE
    var url: String = "Manga URL" //shonenjumpplus.com/episode/[NUMBER HERE]
    var totalViews: Int = 100
    var totalComments: Int = 250
    
    //------DONT KNOW IF THESE ARE NEEDED---------
//    var id = UUID()
//    var images = [Image]() seems like the manga app is using url
//    var shelf: Int = 10
//    var title: String = "Manga Title"
//    var author: String = "Manga Author"
//    var isFavorite: Bool = false
//    var isRecentlyRead: Bool = false
//    var isUpdated: Bool = false
//    var mangaUpdateDay: MangaUpdateDay = .monday
    //--------------------------------------------
    
    init() {
        
    }
    
    //    init (mangaUpdateDay: MangaUpdateDay) {
    //        self.mangaUpdateDay = mangaUpdateDay
    //    }
    
    static let example = Chapter()
}

class Chapters: ObservableObject {
    static let saveKey = "SaveData"
    
    var chapter = Chapter()
    var chapter2 = Chapter()
    var chapter3 = Chapter()
    var chapter4 = Chapter()
    @Published private(set) var shelf: [Chapter] //should've used collection instead of shelf
    
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
    
//    func addRecent(_ manga: Manga) {
//       mangaRecent.append(manga)
//       save()
//    }
//
//    func addFavorite(_ manga: Manga) {
//       mangaFavorite.append(manga)
//       save()
//    }

//    func toggleFavorite(_ chapter: Chapter) {
//        objectWillChange.send()
//        chapter.isFavorite.toggle()
//        save()
//    }
//
//    func toggleRecentlyRead(_ chapter: Chapter) {
//        objectWillChange.send()
//        chapter.isRecentlyRead.toggle()
//        save()
//    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(shelf) {
            saveFile(data: encoded)
        }
    }
    
    //challenge 2
    private func saveFile(data: Data) {
        let url = getDocumentDirectory().appendingPathComponent(Self.saveKey)
        
        do {
            try data.write(to: url, options: [.atomicWrite, .completeFileProtection])
        } catch let error {
            print("Could not save file: " + error.localizedDescription)
        }
    }
    
    //challenge 2
    private func loadFile() -> Data? {
        let url = getDocumentDirectory().appendingPathComponent(Self.saveKey)
        
        if let data = try? Data(contentsOf: url) {
            return data
        }
        
        return nil
    }
    
    //challenge 2
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
//    func decode<T: Decodable>(_ file: String) -> T {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//
//        let decoder = JSONDecoder()
//
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//
//        return loaded
//    }
}


