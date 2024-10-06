//
//  FreeMangaView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct FreeMangaView: View {
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    
    var body: some View {
        Section {
            Picker("Flavor", selection: $selectedFlavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
        }
        Text("Hello world")
//        VStack {
//            Picker("Flavor", selection: $selectedFlavor) {
//                ForEach(Flavor.allCases) { flavor in
//                    Text(flavor.rawValue.capitalized)
//                }
//            }
//            Picker("Topping", selection: $selectedTopping) {
//                ForEach(Topping.allCases) { topping in
//                    Text(topping.rawValue.capitalized)
//                }
//            }
//        }
//        .pickerStyle(.segmented)
    }
}

struct FreeMangaView_Previews: PreviewProvider {
    static var previews: some View {
        FreeMangaView()
    }
}
