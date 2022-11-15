//
//  MyUILabel.swift
//  Representable
//
//  Created by 김응관 on 2022/11/02.
//

import SwiftUI

struct MyUILabel: UIViewRepresentable {
    //UIView 기반의 컴포넌트를 SwiftUI 뷰 선언부에 쉽게 통합하기 위한 프로토콜
    
    var text: String
    
    //UIView 기반 컴퍼넌트의 인스턴스 생성하고
    //필요한 초기화 작업을 수행한 뒤 반환하는 역할을 수행
    func makeUIView(context: UIViewRepresentableContext<MyUILabel>) -> UILabel {
        let myLabel = UILabel()
        myLabel.text = text
        return myLabel
    }
    
    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<MyUILabel>) {
        //필요 작업 수행
    }
}
