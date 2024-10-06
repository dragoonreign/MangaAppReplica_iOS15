//
//  MyCalenderView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/6/24.
//

import SwiftUI

struct MyCalenderView: View {
    let days = [
        "S", "M", "T", "W", "T", "F", "S"
    ]
    
    let weekColumns = [
        GridItem(.adaptive(minimum: 200), spacing: 10, alignment: .center),
        GridItem(.adaptive(minimum: 200), spacing: 10, alignment: .center),
        GridItem(.adaptive(minimum: 200), spacing: 10, alignment: .center),
        GridItem(.adaptive(minimum: 200), spacing: 10, alignment: .center),
        GridItem(.adaptive(minimum: 200), spacing: 10, alignment: .center),
        GridItem(.adaptive(minimum: 200), spacing: 10, alignment: .center),
        GridItem(.adaptive(minimum: 200), spacing: 10, alignment: .center),
    ]
    
    var body: some View {
        VStack {
            Text("Calender: Jan").font(.largeTitle)
            LazyVGrid(columns: weekColumns) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                }
            }
        }
    }
}

struct MyCalenderView_Previews: PreviewProvider {
    static var previews: some View {
        MyCalenderView()
    }
}
