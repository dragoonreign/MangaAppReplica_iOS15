//
//  FreeMangaView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct FreeMangaView: View {
    @State private var selectedFlavor: Flavor = .none
    
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
    }
}

struct FreeMangaView_Previews: PreviewProvider {
    static var previews: some View {
        FreeMangaView()
    }
}
