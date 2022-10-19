//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by 김응관 on 2022/10/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //body 안에는 무조건 컴포넌트 1개만 들어갈 수 있다
        //스택이 여러개 필요할 때는 중첩을 이용한다
        MVStack {
            TitleView()
            Spacer().frame(height:40)
            NamesView()
            Button(action: {print("Start")}) {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width:200, height:70)
                    .overlay(Text("App School")
                        .font(.title2)
                        .foregroundColor(.black))
                
            }.padding()
                    
            Text("Since 2022.09.14").fontWeight(.bold)
        }
        .padding()
        
        //로딩중 표시할 때 보통 사용함
        .onAppear(perform: { print("나타남")})
        .onDisappear(perform: { print("사라짐")})
    }
}

struct MVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack() {
            content()
        }
        .foregroundColor(.purple)
    }
}



struct ContentView_Previews: PreviewProvider {
    //뷰를 여러개 담을 수 있음
    static var previews: some View {
        Group {
            ContentView()
            
            
//                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
//                .previewDisplayName("iPhone 14 Pro")
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Plus"))
//                .previewDisplayName("iPhone 14 Plus")
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
//            //프리뷰 기기 설정
//                .previewDisplayName("iPhone 14")
//            //프리뷰 창 버튼이름이 바뀜
//                .environment(\.colorScheme, .dark)
        }
    }
}

/*
 버튼 생성 방법의 4가지 형식
 Button("Hello", action: {
                 print("전기차를 충전해주세요")
             })
             
             Button("Hello") {
                 print("전기차를 충전해주세요")
             }
             
             Button(action: {
                 print("전기차를 충전해주세요")
             }, label: {
                 Image(systemName: "bolt.car")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .padding()
             })
             
             Button(action: {
                 print("전기차를 충전해주세요")
             }) {
                 Image(systemName: "bolt.car")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .padding()
             }
 */
