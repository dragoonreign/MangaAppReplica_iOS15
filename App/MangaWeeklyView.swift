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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
//                ForEach(mangas.shelf) { manga in
//                    Button() {
//                        mangas.toggleRecentlyRead(manga)
//                    } label: {
//                        // Show the image of the manga
//                        Image("US")
//                            .resizable()
//                            .frame(width: 200, height: 150)
//                            .colorMultiply(manga.isRecentlyRead ? .gray : .white)
//                    }
//                }
                ForEach(0..<10) { num in
                    if (num == 0) {
                        Image("US")
                            .resizable()
//                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                    } else if (num > 0 && num < 3) {
                        Image("US")
                            .resizable()
                            .frame(width: 200, height: 150)
                    } else {
                        Image("US")
                            .resizable()
                            .frame(width: 200, height: 75)
                    }
                }
            }
        }
    }
}

struct MangaWeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        MangaWeeklyView()
            .environmentObject(Mangas())
    }
}
