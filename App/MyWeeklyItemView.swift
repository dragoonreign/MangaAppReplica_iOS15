//
//  MyWeeklyItemView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/9/24.
//

import SwiftUI

struct MyWeeklyItemView: View {
    @EnvironmentObject var mangas: Mangas
    var manga: Manga
    var widthInt: Int
    var heightInt: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink() {
                MangaDetailView(manga: manga)
                    .onAppear {
                        mangas.toggleRecentlyRead(manga)
                    }
            } label: {
                // Show the image of the manga
                Image(manga.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: CGFloat(widthInt), maxWidth: .infinity)
                    .frame(height: CGFloat(heightInt))
                    .colorMultiply(manga.isRecentlyRead ? .gray : .white)
            }
        
            HStack {
                Image(systemName: "eye")
                    .padding([.leading])
                Text("\(manga.totalViews)")
                    .foregroundColor(.primary)
            }
            HStack {
                Image(systemName: "message")
                    .padding([.leading])
                Text("\(manga.totalComments)")
                    .foregroundColor(.primary)
            }
        }
    }
}

struct MyWeeklyItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyWeeklyItemView(manga: Manga(), widthInt: Int(), heightInt: Int())
            .environmentObject(Mangas())
    }
}
