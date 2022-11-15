//
//  ContentView.swift
//  Typhography
//
//  Created by 김응관 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var sampleText = "인권에 대한 무시와 경멸이 인류의 양심을 격분시키는 만행을 초래하였으며, 인간이 언론과 신앙의 자유, 그리고 공포와"
    @State private var fontSize: CGFloat = 12
    @State private var letterSpace: CGFloat = 0 //자간
    @State private var lineSpace: CGFloat = 0
        //행간
    
    var body: some View {
        ScrollView() {
            VStack {
                HStack {
                    Label("글자크기", systemImage: "").font(.system(size: 12))
                    Slider(value: $fontSize, in: -24 ... 40)
                }
                HStack {
                    Label("글자사이", systemImage: "").font(.system(size: 12))
                    Slider(value: $letterSpace, in: -24 ... 40)
                }
                HStack {
                    Label("글줄사이", systemImage: "").font(.system(size: 12))
                    Slider(value: $lineSpace, in: -24 ... 40)
                }
                Text(sampleText).kerning(letterSpace).lineSpacing(lineSpace).font(.system(size:fontSize))
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
