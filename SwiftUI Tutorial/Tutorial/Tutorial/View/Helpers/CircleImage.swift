//
//  CircleImage.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
        //도려내는 수정자(원하는 모양)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
                //원하는 도형의 테두리만 남기게함
                //테두리 색상 & 두께설정
            }
            .shadow(radius: 7)
        //그림자 효과부여
        //얼마나 그림자가 퍼지는지를 radius를 통해 조절
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
