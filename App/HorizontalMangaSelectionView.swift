//
//  HorizontalMangaSelectionView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

enum FilterType {
    case none, favorites, recentlyRead, updated
}

enum SortType {
    case name, recent, updated
}

struct HorizontalMangaSelectionView: View {
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
    
//    var filteredSortedMangas: [Manga] {
//        switch sort {
//        case .updated:
//            return filteredMangas.sorted { $0.isUpdated < $1.isUpdated }
//        case .recent:
//            return filteredMangas.sorted { $0.date < $1.date }
//        }
//    }
    
    var body: some View {
        // 最近見た
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filteredMangas) { manga in
                    Button() {
                        mangas.toggleRecentlyRead(manga)
                    } label: {
                        // Show the image of the manga
                        Image("US")
                            .resizable()
                            .frame(width: 200, height: 150)
                    }
                }
            }
        }
    }
}

struct HorizontalMangaSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalMangaSelectionView(filter: FilterType.none)
            .environmentObject(Mangas())
    }
}
