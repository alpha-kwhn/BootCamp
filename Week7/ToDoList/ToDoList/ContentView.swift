//
//  ContentView.swift
//  ToDoList
//
//  Created by 김응관 on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MonthView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Monthly")
                }
            TodayView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Today")
                }
            NotyetView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Not yet")
                }
        }
    }
}

struct TodayView: View {
    var body: some View {
        VStack{
            Text("1")
        }
    }
}

struct NotyetView: View {
    var body: some View {
        VStack{
            Text("1")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
