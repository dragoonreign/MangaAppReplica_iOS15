//
//  Manga.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import Foundation
import SwiftUI

enum MangaUpdateDay {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

class Manga: Identifiable, Codable {
    var id = UUID()
//    var images = [Image]()
    var title: String = "Manga Title"
    var author: String = "Manga Author"
    var url: String = "Manga URL"
    var shelf: Int = 10
    var isFavorite: Bool = false
    var isRecentlyRead: Bool = false
    var isUpdated: Bool = false
    var mangaUpdateDay: MangaUpdateDay = .monday
    
    static let example = Manga()
}


class Mangas: ObservableObject {
    static let saveKey = "SaveData"
    
    var manga = Manga()
    var manga2 = Manga()
    var manga3 = Manga()
    var manga4 = Manga()
    @Published private(set) var shelf: [Manga]
    // @Published private(set) var mangaFavorite: [Manga]
    // @Published private(set) var mangaRecent: [Manga]
    // @Published private(set) var mangaDict<"String", Manga>: [:]
    
    init() {
        shelf = []
        shelf.append(manga)
        shelf.append(manga2)
        shelf.append(manga3)
        shelf.append(manga4)
//        mangaFavorite = []
//        mangaRecent = []
//        mangaDict = [
//            "shelves" : shelf,
//            "favorites" : mangaFavorite,
//            "recents" : mangaRecent,
//        ]
        
        if let data = loadFile() {
            if let decoded = try? JSONDecoder().decode([Manga].self, from: data) {
                shelf = decoded
                return
            }
        }
    }
    
    func addshelf(_ manga: Manga) {
        shelf.append(manga)
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

    func toggleFavorite(_ manga: Manga) {
        objectWillChange.send()
        manga.isFavorite.toggle()
        save()
    }
    
    func toggleRecentlyRead(_ manga: Manga) {
        objectWillChange.send()
        manga.isRecentlyRead.toggle()
        save()
    }
    
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


