//
//  ContentView.swift
//  Chartss
//
//  Created by 김응관 on 2022/11/17.
//

import SwiftUI
import Charts

struct ContentView: View {
    let weekdays = Calender.current.shortWeekdaySymbols
    let steps = [10531, 6019, 7200, 8311, 7403, 6503, 9230]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(weekdays.indices, id:\.self) { index in
                    BarMark(x: .value("Day", weekdays[index]),
                            y: .value("Step", steps[index])
                    )
                    
                    BarMark(x: .value("Day", "Tuesday"),
                            y: .value("Step", 7200)
                    )
                }
            }
        }
        .padding()
        .navigationTitle("Weekly Report")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
