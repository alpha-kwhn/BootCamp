//
//  TitleView.swift
//  HelloSwiftUI
//
//  Created by 김응관 on 2022/10/18.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack{
//            Image(systemName: "bolt.car")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            //.fill : 어떻게든 화면 다 채우려고 노력
                //.foregroundColor(.gray)
            //SF Symbols에 있는 그림 이름을 따오면 됨
            Text("LIKE LION 2조")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundColor(Color.blue)
                .padding()
                .border(Color.blue,width:4)
                
        }
    }
}


struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
