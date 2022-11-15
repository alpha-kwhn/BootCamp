//
//  ContentView.swift
//  GestureDemo
//
//  Created by 김응관 on 2022/11/01.
//

import SwiftUI

struct ContentView: View {
    @State private var magnification: CGFloat = 1.0
    @GestureState private var offset: CGSize = .zero
    @GestureState private var longPress: Bool = false
    
    var body: some View {
        let tap = TapGesture(count: 2).onEnded { _ in
            print("Tapped")
        }
        
        let longPress = LongPressGesture(minimumDuration: 10, maximumDistance: 25).updating($longPress) {value, state, transition in
            state = value}
            .simultaneously(with: DragGesture())
            .updating($offset) { value, state, transition in
                state = value.second?.translation ?? .zero
            }
            .onEnded { _ in
            print("Long Press")
        }
        
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0).onChanged({ value in
            self.magnification = value
        }).onEnded { _ in print("Gesture Ended")}
        
        let drag = DragGesture()
            .updating($offset) { dragValue, state, transaction in state = dragValue.translation}
        
        return Image(systemName: "hand.point.right.fill")
            .offset(offset)
            .gesture(drag)
        
//        return VStack {
//            Spacer()
//            Image(systemName: "hand.point.right.fill")
//            .gesture(tap)
//            Spacer()
//            Image(systemName: "hand.point.right.fill").gesture(longPress)
//            Spacer()
//            Image(systemName: "hand.point.right.fill")
//                .resizable()
//                .scaleEffect(magnification)
//                .gesture(magnificationGesture)
//                .frame(width: 100, height: 90)
//            Spacer()
//        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
