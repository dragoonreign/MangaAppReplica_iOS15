//
//  AutoScrollerView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/6/24.
//

import SwiftUI

struct AutoScrollerView: View {
    var imageNames: [String]
    @GestureState private var dragOffset: CGFloat = 0
    
    @State private var selectedImageIndex: Int = 0
    @State private var currIndex: Int = 0

    var body: some View {
        ZStack {
            HStack {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    Capsule()
                        .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 35, height: 8)
                        .onTapGesture {
                            selectedImageIndex = index
                        }
                }
                .offset(y: 130) 
            }
            
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        Image("\(imageNames[index])")
                            .resizable()
                            .scaledToFit()
                            .tag(index)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .frame(height: 200) 
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) 
            .ignoresSafeArea()
        }
    }
}

struct AutoScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        AutoScrollerView(imageNames: [String]())
    }
}
