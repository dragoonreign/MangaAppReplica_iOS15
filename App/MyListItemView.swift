//
//  MyListItemView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/9/24.
//

import SwiftUI

struct MyListItemView: View {
    @EnvironmentObject var mangas: Mangas
    var manga: Manga
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink() {
                MangaDetailView(manga: manga)
                    .onAppear {
                        mangas.toggleRecentlyRead(manga)
                    }
            } label: {
                // Show the image of the manga
                HStack {
                    Image(manga.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                    
                    VStack {
                        Text("\(manga.title)")
                            .lineLimit(0)
                            .padding([.leading])
                    }
                }
            }
        }
    }
}

struct MyListItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyListItemView(manga: Manga())
            .environmentObject(Mangas())
    }
}
