//
//  ContentView.swift
//  WebMapDemo
//
//  Created by 김응관 on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Int = 1
    
    var body: some View {
        TabView(selection: $tabSelection){
           WebTabView().tabItem{
                Image(systemName: "safari")
                Text("Web")
            }.tag(1)
            
            MapTabView().tabItem {
                Image(systemName: "map")
                Text("Map")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
