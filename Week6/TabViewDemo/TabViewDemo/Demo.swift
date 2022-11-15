//
//  Demo.swift
//  TabViewDemo
//
//  Created by 김응관 on 2022/10/26.
//

import SwiftUI

struct Demo: View {
    @State private var tabSelection = 3
    //현재의 탭뷰 선택을 저장하기 위해 활용
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView {
                SecondView()}.tabItem { Image(systemName: "house.fill")
                Text("Tab Label 1")
            }.tag(1)
            NavigationView {
                SecondView()}.tabItem { Image(systemName: "house.fill")
                Text("Tab Label 2")
            }.tag(2)
            NavigationView {
                SecondView()}.tabItem { Image(systemName: "house.fill")
                Text("Tab Label 3")
            }.tag(3)
        }
    }
}

struct SecondView: View {
    var body: some View {
        List {
            NavigationLink(destination: {
                ThirdView()
            }, label: {
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello World")
                }
            })
        }
        .navigationTitle(Text("Hello World"))
    }
}

struct ThirdView: View {
    var body: some View {
        List {
            Text("Hello World")
                .font(.largeTitle)
        }
        .navigationTitle(Text("Hi World"))
    }
}


struct Demo_Previews: PreviewProvider {
    static var previews: some View {
        Demo()
    }
}
