//
//  ContentView.swift
//  ReSwiftUIDemo
//
//  Created by 김응관 on 2022/10/20.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colorNames: [String] = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 10.0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 5), value: rotation)
            //효과를 부드럽게 해 줌
                .foregroundColor(colors[colorIndex])
                .lineLimit(1)
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach(0 ..< colorNames.count, id: \.self) {
                    //struct에 있는 기본 프로퍼티를 지칭함을 강조하는 \.self임
                    Text(self.colorNames[$0]).foregroundColor(self.colors[$0])
                }
            }.pickerStyle(.wheel)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
