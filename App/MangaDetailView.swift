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
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(manga.image)
                    .resizable()
                    .scaledToFill()
                
                //Title
                HStack {
                    Text("\(manga.title)")
                        .font(.largeTitle)
                    Spacer()
                    Button {
                        mangas.toggleFavorite(manga)
                    } label: {
                        if (manga.isFavorite) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height:30)
                        } else {
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height:30)
                        }
                    }
                }
                .padding([.leading])
                
                //Author
                HStack{
                    Text("\(manga.author)")
                        .font(.title2)
                    Spacer()
                }
                .padding([.leading])
                
                Divider()
                
                //Summary
                Group {
                    HStack {
                        Text("Summary")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    Text("\(manga.description)")
                }
                .padding([.leading])
                
                //Views and comments
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
                
                Divider()
                
                List(0..<10) { num in
                    NavigationLink() {
                        Text("Chapter \(num)")
                    } label: {
                        // Show the image of the manga
                        HStack{
                            Image(manga.image)
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
                .frame(minHeight: minRowHeight * CGFloat(mangas.shelf.count + 2))
            }
        }
        //if this was ios 16 toolbar { hidetoolbar }
    }
}

struct MangaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MangaDetailView(manga: Manga())
            .environmentObject(Mangas())
    }
}
