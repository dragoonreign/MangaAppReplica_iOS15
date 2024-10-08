//
//  VerticalMangaSelectionView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/7/24.
//

import SwiftUI

struct VerticalMangaSelectionView: View {
    //get the list of manga here
    @EnvironmentObject var mangas: Mangas
    
    let filter: FilterType
    
//    @State var sort: SortType = .name
    
    var filteredMangas: [Manga] {
        switch filter {
        case .none:
            return mangas.shelf
        case .favorites:
            return mangas.shelf.filter { $0.isFavorite }
        case .recentlyRead:
            return mangas.shelf.filter { $0.isRecentlyRead }
        case .updated:
            return mangas.shelf.filter { $0.isUpdated }
        }
    }
    
    var body: some View {
        // 最近見た
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text("Hello")
                List(filteredMangas) { manga in
                    Text("\(manga.author)")
                }
                Text("World")
//                if (filter == .none) {
//                    ForEach(filteredMangas) { manga in
//                        Button() {
//                            mangas.toggleRecentlyRead(manga)
//                        } label: {
//                            // Show the image of the manga
//                            Image("US")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(maxWidth: .infinity)
//                                .frame(maxHeight: 50)
//                        }
//                    }
//                } else {
//                    ForEach(filteredMangas) { manga in
//                        Button() {
//                            print("hello world")
//                        } label: {
//                            // Show the image of the manga
//                            Image("UK")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(maxWidth: .infinity)
//                                .frame(maxHeight: 50)
//                        }
//                    }
//                }
            }
        }
        
    }
}

struct VerticalMangaSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalMangaSelectionView(filter: FilterType.none)
            .environmentObject(Mangas())
    }
}
