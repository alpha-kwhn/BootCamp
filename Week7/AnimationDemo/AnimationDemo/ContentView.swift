//
//  ContentView.swift
//  AnimationDemo
//
//  Created by 김응관 on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation: Double = 0.0
    @State private var scale: CGFloat = 1.0
    var body: some View {
        
        VStack {
            Button(action: {
    
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    rotation = rotation < 360 ? rotation + 60 : 0
                    scale = scale < 2.8 ? scale + 0.3 : 1
                }
            }) {
                Text("Click to animate")
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
//                    .animation(.spring(response: 1, dampingFraction: 0.8, blendDuration: 0), value: scale)
            }
        }
        .padding()
    }
}

struct BindingView: View {
    @State private var visibility: Bool = false
    
    var body: some View {
        VStack{
            Toggle(isOn: $visibility.animation(.easeInOut(duration: 5))) {
                Text("Toggle Text Views")
            }
            if visibility {
                Text("Hello World")
            } else {
                Text("Goodbye World")
            }
        }
        .padding()
    }
}

struct ChangeView: View {
    @State private var isButtonVisible: Bool = true
    
    var body: some View {
        VStack{
            Toggle(isOn:$isButtonVisible.animation(.linear(duration: 2))){
                Text("Show/Hide Button")
            }
            .padding()
            
            if isButtonVisible {
                Button(action:{}){
                    Text("Example Button")
                }
                .font(.largeTitle)
                .transition(.opacity.combined(with: .move(edge: .top)))
            } else {
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeView()
    }
}
