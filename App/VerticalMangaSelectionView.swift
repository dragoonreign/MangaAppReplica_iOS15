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
//                    Text("\(manga.author)")
                    if (filter == .none) {
                        Button() {
                            mangas.toggleRecentlyRead(manga)
                        } label: {
                            // Show the image of the manga
                            HStack {
                                Image("US")
//                                    .padding([.leading])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .frame(maxHeight: 50)
                                
                                VStack {
                                    Text("\(manga.title)")
//                                        .padding([.leading])
                                    Text("\(manga.author)")
//                                        .padding([.leading])
                                }
                                
                                VStack {
                                    Image(systemName: "eye")
//                                        .padding([.leading])
                                    Image(systemName: "message")
//                                        .padding([.leading])
                                }
                                
                                VStack {
                                    Text("\(manga.totalViews)")
//                                        .padding([.leading])
                                    Text("\(manga.totalComments)")
//                                        .padding([.leading])
                                }
                            }
                        }
                    } else if (filter == .recentlyRead) {
                        Button() {
                            print("recently read")
                        } label: {
                            // Show the image of the manga
                            HStack {
                                Image("UK")
//                                    .padding([.leading])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .frame(maxHeight: 50)
                                
                                VStack {
                                    Text("\(manga.title)")
//                                        .padding([.leading])
                                    Text("\(manga.author)")
//                                        .padding([.leading])
                                }
                                
                                VStack {
                                    Image(systemName: "eye")
//                                        .padding([.leading])
                                    Image(systemName: "message")
//                                        .padding([.leading])
                                }
                                
                                VStack {
                                    Text("\(manga.totalViews)")
//                                        .padding([.leading])
                                    Text("\(manga.totalComments)")
//                                        .padding([.leading])
                                }
                            }
                        }
                    } else if (filter == .favorites) {
                        Button() {
                            print("favorite")
                        } label: {
                            // Show the image of the manga
                            HStack {
                                Image("Italy")
//                                    .padding([.leading])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .frame(maxHeight: 50)
                                
                                VStack {
                                    Text("\(manga.title)")
//                                        .padding([.leading])
                                    Text("\(manga.author)")
//                                        .padding([.leading])
                                }
                                
                                VStack {
                                    Image(systemName: "eye")
//                                        .padding([.leading])
                                    Image(systemName: "message")
//                                        .padding([.leading])
                                }
                                
                                VStack {
                                    Text("\(manga.totalViews)")
//                                        .padding([.leading])
                                    Text("\(manga.totalComments)")
//                                        .padding([.leading])
                                }
                            }
                        }
                    }
                }
                .frame(minHeight: minRowHeight * CGFloat(filteredMangas.count + 2))
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
