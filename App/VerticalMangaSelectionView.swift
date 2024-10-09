//
//  VerticalMangaSelectionView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/7/24.
//

import SwiftUI

struct VerticalMangaSelectionView: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
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
                List(filteredMangas) { manga in
                    if (filter == .none) {
                        MyListItemView(manga: manga)
                    } else if (filter == .recentlyRead) {
                        MyListItemView(manga: manga)
                    } else if (filter == .favorites) {
                        MyListItemView(manga: manga)
                    }
                }
                .frame(minHeight: minRowHeight * CGFloat(filteredMangas.count + 3))
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
