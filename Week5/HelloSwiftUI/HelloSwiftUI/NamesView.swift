//
//  NamesView.swift
//  HelloSwiftUI
//
//  Created by ๊น์๊ด on 2022/10/18.
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
                Text("๐ฅ").font(.largeTitle)
                Image("kong")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
            }
            .padding()
            .border(Color.black, width:5)
            //์ฌ์ง ๋๊ทธ๋๊ฒ ๋ฃ๋ ์ฝ๋
            MyHStack{
                Text("Ned")
                    .modifier(NedName())
                Spacer().frame(width: 50)
                MyVStack(){
                    Text("๊น๋ํฌ")
                        .modifier(StandardName())
                    Text("๊น๋ณด๋ฏธ")
                        .modifier(StandardName())
                    Text("๊น์๊ด")
                        .modifier(StandardName())
                    Text("๋ฐ์ฑ๋ฏผ")
                        .modifier(StandardName())
                    Text("๋ฐํ์ข")
                        .modifier(StandardName())
                    Text("์ ์นํ")
                        .modifier(StandardName())
                    Text("์ฅ์ขํ")
                        .modifier(StandardName())
                    Text("ํ์ฃผํฌ")
                        .modifier(StandardName())
                }
            }
        }
        //.font(.custom)
        //์ง์  ์ปค์คํํ ๊ธ๊ผด ์ง์ด๋ฃ๊ธฐ -> ํ์ง๋ง ์ ๋งํ๋ฉด ๊ธฐ๋ณธ๊ธ๊ผด์จ๋ผ,, ์ฉ๋ ์ปค์ง๋ค
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

//๋ทฐ ๋น๋ HStack์ ์ ์ฉ -> ์คํ ๋ด๋ถ ์คํ์ด์ฑ์ ์ ๋ถ 40์ผ๋ก
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




//์์ ์
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
