//
//  MangaWeeklyView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/5/24.
//

import SwiftUI

struct MangaWeeklyView: View {
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    
    @EnvironmentObject var mangas: Mangas
    
    var body: some View {
        // 最近見た
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(Array(mangas.shelf.enumerated()), id: \.offset) { num, manga in
                    if (num == 0) {
                        Button() {
                            mangas.toggleRecentlyRead(manga)
                        } label: {
                            // Show the image of the manga
                            Image("US")
                                .resizable()
                                .frame(width: 400, height: 250)
                                .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                        }
                    } else if (num == 0) {
                        Button() {
                            mangas.toggleRecentlyRead(manga)
                        } label: {
                            // Show the image of the manga
                            Image("US")
                                .resizable()
                                .frame(width: 200, height: 175)
                                .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                        }
                    } else {
                        Button() {
                            mangas.toggleRecentlyRead(manga)
                        } label: {
                            // Show the image of the manga
                            Image("US")
                                .resizable()
                                .frame(width: 200, height: 100)
                                .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                        }
                    }
                }
            }
            //vstack
            .background(.primary)
        }
    }
}

struct MangaWeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        MangaWeeklyView()
            .environmentObject(Mangas())
    }
}
