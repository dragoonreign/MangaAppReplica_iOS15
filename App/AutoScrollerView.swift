//
//  AutoScrollerView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/6/24.
//

import SwiftUI

struct AutoScrollerView: View {
    var imageNames: [String]
//    let timer = Timer.publish(every: 10.0, on: .main, in: .common).autoconnect()

    //from multiple carousel
//    private let content: (T) -> Content
//    private let items: [T]
//    private let horizontalSpacing: CGFloat
//    private let trailingSpacing: CGFloat
//
    @GestureState private var dragOffset: CGFloat = 0
    
    // Step 3: Manage Selected Image Index
    @State private var selectedImageIndex: Int = 0
    @State private var currIndex: Int = 0

    var body: some View {
//         GeometryReader { proxy in
//             let pageWidth = (proxy.size.width)
////             let currentOffset = dragOffset - (CGFloat(index) * pageWidth)
        
        ZStack {
            // Step 12: Navigation Dots
            HStack {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    // Step 13: Create Navigation Dots
                    Capsule()
                        .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 35, height: 8)
                        .onTapGesture {
                            // Step 14: Handle Navigation Dot Taps
                            selectedImageIndex = index
                        }
                }
                .offset(y: 130) // Step 15: Adjust Dots Position
            }
            
            // Step 4: Background Color
//            Color.secondary
//                .ignoresSafeArea()

            // Step 5: Create TabView for Carousel
            TabView(selection: $selectedImageIndex) {
                // Step 6: Iterate Through Images
                ForEach(0..<imageNames.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        // Step 7: Display Image
                        Image("\(imageNames[index])")
                            .resizable()
                            .scaledToFit()
                            .tag(index)
                            .frame(maxWidth: .infinity)
                    }
//                    .background(VisualEffectBlur()) // Step 8: Apply Visual Effect Blur
//                    .shadow(radius: 20) // Step 9: Apply Shadow
                }
            }
            .frame(height: 200) // Step 10: Set Carousel Height
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Step 11: Customize TabView Style
            .ignoresSafeArea()
//            .gesture(
//                DragGesture()
//                    .updating($dragOffset) { value, state, _ in
//                        if (currIndex == 0 && value.translation.width > 0) || (currIndex == imageNames.count - 1 && value.translation.width < 0) {
//                            state = value.translation.width / 4
//                            print("check1, \(currIndex)")
//                        } else {
//                            state = value.translation.width
//                            print("check2, \(currIndex)")
//                        }
//                    }
//                    .onEnded { value in
//                        let dragThreshold = pageWidth / 20
//                        if value.translation.width > abs(dragThreshold) {
//                            currIndex -= 1
//                            print("check3, \(currIndex)")
//                        }
//                        if value.translation.width < abs(dragThreshold) {
//                            currIndex += 1
//                            print("check4, \(currIndex)")
//                        }
//                        currIndex = max(min(currIndex, imageNames.count - 1), 0)
//                        print("check5, \(currIndex)")
//                    }
//            )
        }
        
        //timer
//        .onReceive(timer) { _ in
//            currIndex += 1
//            // Step 16: Auto-Scrolling Logic
//            withAnimation(.default) {
//                selectedImageIndex = (selectedImageIndex + 1) % imageNames.count
//            }
//        }
        
        
//     }
//     geometry reader
    }
}

struct AutoScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        AutoScrollerView(imageNames: [String]())
    }
}
