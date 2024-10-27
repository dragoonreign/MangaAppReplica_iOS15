//
//  Bundle-Decodable.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/27/24.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
            
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
        //        return loaded
        
        do {
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
        
    }
}
