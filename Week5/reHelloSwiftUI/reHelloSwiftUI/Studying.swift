//
//  Studying.swift
//  reHelloSwiftUI
//
//  Created by 김응관 on 2022/10/19.
//

import SwiftUI

struct Studying: View {
    var body: some View {
//        MyVStack {
//            Text("abcd")
//            Text("abcd")
//            Text("abcd")
//        }
        VStack{
            VStack{
                Text("Hello World!")
                    .border(.black)
                Text("2")
                Text("3")
                Text("4")
                Text("2")
                Text("3")
                Text("4")
            }.frame(width:100, height: 100)
            VStack {
                Text("Hello World!")
                    .border(.black)
                Text("2")
                Text("3")
                Text("4")
                Text("2")
                Text("3")
                Text("4")
            }
        }
    }
}

struct MyVStack<Content: View>: View {
//여러 종류가 있는 View -> 얘네 중 아무거나 다 올 수 있다
    let content: () -> Content
//클로저를 담는 상수?
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    //content 파라미터로 전달된 클로저(@escaping () -> Content)
    //하지만 전달된 클로저는 init {} 영역 안에서만 원래 실행이 가능(할당도 불가)
    //그러나 @escaping을 통해 self.content라는 상수에 할당이 가능해짐

    var body: some View {
        VStack {
            Group {
                content()
            }
        }
        .font(.largeTitle)
    }
}



struct Studying_Previews: PreviewProvider {
    static var previews: some View {
        Studying()
    }
}
