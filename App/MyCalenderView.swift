//
//  MyCalenderView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/6/24.
//

import SwiftUI

struct MyCalenderView: View {
    @State private var date = Date.now
    @State private var daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    
    @State private var pickedDayOfWeek = 0
    
    var getDayOfWeek: Int {
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
        VStack {
            Text("Picked Day of the week: \(pickedDayOfWeek)")
            
            Text("\(getDayOfWeek)")
            
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Button {
                        pickedDayOfWeek = index
                        print("\(pickedDayOfWeek)")
                    } label: {
                        if (getDayOfWeek == index) {
                            Text(daysOfWeek[index])
                                .fontWeight(.black)
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity)
                                .background(
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 30, height: 30)
                                )
                        } else if (getDayOfWeek != index) {
                            Text(daysOfWeek[index])
                                .fontWeight(.black)
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity)
                        }
                    }
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
