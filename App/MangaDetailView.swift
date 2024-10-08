//
//  MangaDetailView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/8/24.
//

import SwiftUI

struct MangaDetailView: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @EnvironmentObject var mangas: Mangas
    var manga: Manga
    var chapters = Chapters()
//    var message: String
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image("France")
                    .resizable()
                    .scaledToFill()
                
                HStack {
                    Text("Manga Detail View \(manga.title)")
                    Spacer()
                    Button {
                        mangas.toggleFavorite(manga)
                    } label: {
                        if (manga.isFavorite) {
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height:30)
                        } else {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height:30)
                        }
                    }
                }
                .padding([.leading])
                
                HStack{
                    Text("Manga Detail View \(manga.author)")
                    Spacer()
                }
                .padding([.leading])
                
                HStack {
                    Spacer()
                    Image(systemName: "eye")
                    Text("\(manga.totalViews)")
                }
                .padding([.trailing])
                
                HStack {
                    Spacer()
                    Image(systemName: "message")
                    Text("\(manga.totalComments)")
                }
                .padding([.trailing])
                
                List(0..<10) { num in
                    NavigationLink() {
                        Text("Chapter \(num)")
//                        MangaDetailView(manga: manga)
//                                        mangas.toggleRecentlyRead(manga)
                    } label: {
                        // Show the image of the manga
                        HStack{
                            Image("Spain")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 50)
                                .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                            Text("\(manga.title)")
                            Spacer()
                            Text("Chapter \(num)")
                        }
                    }
                }
                .frame(minHeight: minRowHeight * CGFloat(20))
            }
        }
    }
}

struct MangaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MangaDetailView(manga: Manga())
            .environmentObject(Mangas())
    }
}
