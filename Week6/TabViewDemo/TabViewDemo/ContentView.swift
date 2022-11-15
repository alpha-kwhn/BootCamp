//
//  ContentView.swift
//  TabViewDemo
//
//  Created by 김응관 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var foregroundColor: Color = Color.white
    @State private var backgroundColor: Color = Color.purple
    
    var body: some View {
        VStack{
            Text("Hello World")
                .font(.largeTitle)
                .padding()
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .contextMenu {
                    Button(action: {
                        self.foregroundColor = .black
                        self.backgroundColor = .white
                    }) {
                        Text("Normal Colors")
                        Image(systemName: "paintbrush")
                    }
                    
                    Button(action: {
                        self.foregroundColor = .white
                        self.backgroundColor = .purple
                    }){
                        Text("Purple Colors")
                        Image(systemName: "paintbrush.fill")
                    }
                }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
