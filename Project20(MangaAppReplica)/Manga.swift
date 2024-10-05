//
//  Manga.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import Foundation
import SwiftUI

class Manga: Identifiable, Codable {
    var id = UUID()
//    var images = [Image]()
    var author: String = "Manga Author"
    var url: String = "Manga URL"
    var volume: Int = 10
    var isFavorite: Bool = false
    var isRecentlyRead: Bool = false
    
    static let example = Manga()
}


class Mangas: ObservableObject {
    static let saveKey = "SaveData"
    
    @Published private(set) var mangaVolume: [Manga]
    
    init() {
        //challenge 2
        mangaVolume = []
        
        if let data = loadFile() {
            if let decoded = try? JSONDecoder().decode([Manga].self, from: data) {
                mangaVolume = decoded
                return
            }
        }
    }
    
//    func add(_ manga: Manga) {
//        mangaVolume.append(manga)
//        save()
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
        if let encoded = try? JSONEncoder().encode(mangaVolume) {
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


