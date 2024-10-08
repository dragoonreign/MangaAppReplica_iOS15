//
//  AccountView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct AccountView: View {
    @State private var selectedFlavor: Flavor = .none
    
    var body: some View {
        NavigationView {
    //        Text("Account View")
            HStack {
                VerticalMangaSelectionView(filter: selectedFlavor.suggestedFilter)
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

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
