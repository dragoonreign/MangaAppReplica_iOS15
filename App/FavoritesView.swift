//
//  FavoritesView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var selectedFlavor: Flavor = .none
    
    @State var pickedDayOfWeek : Int {
        var dayInt = 0
        
        switch(Date().formatted(Date.FormatStyle().weekday())) {
        case("Sun"):
            dayInt = 0
        case("Mon"):
            dayInt = 1
        case("Tue"):
            dayInt = 2
        case("Wed"):
            dayInt = 3
        case("Thu"):
            dayInt = 4
        case("Fri"):
            dayInt = 5
        case("Sat"):
            dayInt = 6
        default:
            dayInt = 0
        }
        
        return dayInt
    }
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                // TEST
                // Replace here with other
                MyCalenderView(pickedDayOfWeek: $pickedDayOfWeek)
                MangaWeeklyView(pickedDayOfWeek: $pickedDayOfWeek)
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
