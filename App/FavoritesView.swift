//
//  FavoritesView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var selectedFlavor: Flavor = .none
    
    @State var pickedDayOfWeek = 1
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                // TEST
                // Replace here with other
                MyCalenderView(pickedDayOfWeek: $pickedDayOfWeek)
                MangaWeeklyView(pickedDayOfWeek: $pickedDayOfWeek)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
