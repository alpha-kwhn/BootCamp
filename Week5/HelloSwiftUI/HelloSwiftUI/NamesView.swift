//
//  NamesView.swift
//  HelloSwiftUI
//
//  Created by 김응관 on 2022/10/18.
//

import SwiftUI

struct NamesView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15.0) {
            //Image(systemName: "hands.sparkles.fill")
            HStack{
                Image("ralo")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                Text("🔥").font(.largeTitle)
                Image("kong")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
            }
            .padding()
            .border(Color.black, width:5)
            //사진 동그랗게 넣는 코드
            MyHStack{
                Text("Ned")
                    .modifier(NedName())
                Spacer().frame(width: 50)
                MyVStack(){
                    Text("김도희")
                        .modifier(StandardName())
                    Text("김보미")
                        .modifier(StandardName())
                    Text("김응관")
                        .modifier(StandardName())
                    Text("박성민")
                        .modifier(StandardName())
                    Text("박훈종")
                        .modifier(StandardName())
                    Text("유승태")
                        .modifier(StandardName())
                    Text("장종환")
                        .modifier(StandardName())
                    Text("한주희")
                        .modifier(StandardName())
                }
            }
        }
        //.font(.custom)
        //직접 커스텀한 글꼴 집어넣기 -> 하지만 왠만하면 기본글꼴써라,, 용량 커진다
    }
}

struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .foregroundColor(.purple)
        .padding()
    }
}

//뷰 빌더 HStack에 적용 -> 스택 내부 스페이싱을 전부 40으로
struct MyHStack<Content : View> : View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        HStack(spacing: 32) {
            content()
        }
        .padding()
    }
}




//수정자
struct StandardName: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
    }
}

struct NedName: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.red)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
    }
}
