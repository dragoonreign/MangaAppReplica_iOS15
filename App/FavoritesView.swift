//
//  FavoritesView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var selectedFlavor: Flavor = .none
    
    @State var pickedDayOfWeek = 1 // same as homeview.swift. 3 options here. Use client side data manager like appdata/userdata to save picked day, use current weekday, or leave it as is. 
    
    var body: some View {
        NavigationView {
            VStack {
                // TEST
                // Replace here with other
                MyCalenderView(pickedDayOfWeek: $pickedDayOfWeek)
                MangaWeeklyView(pickedDayOfWeek: $pickedDayOfWeek)
                Spacer()
            }
            // .toolbar {
            //     ToolbarItem(placement: .principal) {
            //         Picker("Flavor", selection: $selectedFlavor) {
            //             ForEach(Flavor.allCases) { flavor in
            //                 Text(flavor.rawValue.capitalized)
            //             }
            //         }
            //         .pickerStyle(.segmented)
            //     }
            // }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
