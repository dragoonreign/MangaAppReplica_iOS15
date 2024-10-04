//
//  ContentView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }
    
    @State private var selectedFlavor: Flavor = .chocolate

    enum Topping: String, CaseIterable, Identifiable {
        case nuts, cookies, blueberries
        var id: Self { self }
    }
    
    extension Flavor {
        var suggestedTopping: Topping {
            switch self {
            case .chocolate: return .nuts
            case .vanilla: return .cookies
            case .strawberry: return .blueberries
            }
        }
    }


@State private var suggestedTopping: Topping = .nuts
    var body: some View {
        NavigationView {
            VStack {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                    }
                }
                Picker("Topping", selection: $selectedTopping) {
                    ForEach(Topping.allCases) { topping in
                        Text(topping.rawValue.capitalized)
                    }
                }
            }
            .pickerStyle(.segmented)
        }
            
        TabView {
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                ReceivedView()
            }
            .badge(2)
        
        
            Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                SentView()
            }
        
        
            Tab("Account", systemImage: "person.crop.circle.fill") {
                AccountView()
            }
            .badge("!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
