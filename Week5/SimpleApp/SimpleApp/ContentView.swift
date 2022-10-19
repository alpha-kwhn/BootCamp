//
//  ContentView.swift
//  SimpleApp
//
//  Created by 김응관 on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var nums: Double = Double.random(in: 0.0 ... 360.0)
    @State private var colorIndex = 0
    @State private var text: String = ""
    @State private var rotation: Double = 0.0

    var body: some View {
        GeometryReader { geo in
            VStack{
                Image("dart")
                    .resizable()
                    .clipShape(Capsule())
                    .frame(width:300, height:300)
                    .overlay(
                        VStack {
                            Image(systemName: "arrow.down")
                                .resizable()
                                .frame(width: 30, height: 80)
                            Text("발표자")
                        }
                        .frame(width: geo.size.width / 4 * 3, height: geo.size.height / 2)
                        .rotationEffect(.degrees(self.rotation))
                        .animation(.easeInOut(duration: 5), value: self.rotation)
                        .foregroundColor(self.colors[self.colorIndex])
                    )
                
                TextField("문장을 입력하시오", text: $text)
                Slider(value: $rotation, in: 0...nums, step:0.1)
                //... 양 옆에 공백의 수만 같으면 오류 없음
                HStack {
                    Text("Color")
                    Picker(selection: $colorIndex, label: Text("Color")) {
                        ForEach (0..<colornames.count, id: \.self ) {
                            Text(self.colornames[$0])
                                .foregroundColor(self.colors[$0])
                        }
                    }.pickerStyle(.wheel)
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
