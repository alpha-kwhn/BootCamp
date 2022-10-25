//
//  DolLimPan.swift
//  ReSwiftUIDemo
//
//  Created by 김응관 on 2022/10/21.
//

import SwiftUI

struct DolLimPan: View {
    @State private var memberCount = 2
    @State private var myCircleElement: [(Double, Double, Color, String)]
    
    
    var body: some View {
        VStack{
            Header(memberCount: $memberCount, myCircleElement: $myCircleElement)
            Bodies(memberCount: $memberCount, myCircleElement: $myCircleElement)
            Footer(memberCount: $memberCount, myCircleElement: $myCircleElement)
        
    }
}


// 인원설정
struct Header: View {
    @Binding var memberCount: Int
    @Binding var myCircleElement: [(Double, Double, Color, String)]
    var body: some View {
        HStack {
            Text("개수")
            
            //-버튼
            Button(action: {
                if memberCount == 2{
                    return
                }
                else {
                    memberCount -= 1
                }
            }){
                Text("-")
            }
            
            //현재 선택된 인원수를 보여주는 텍스트
            Text("인원수 : \(memberCount)")
            
            Button(action: {
                //9이상이면 설정불가
                if memberCount == 9{
                    return
                }
                else {
                    memberCount += 1
                }
            }){
                Text("+")
            }
        }
    }
    func calculate(num: Int) {
        var circleElement: [(Double, Double, Color, String)] = []
        
        let tmp = Double(360/num)
        var firstAngle: Double = 0
        var secondAngle: Double = Double(360/num)
        var sampleColor: [Color] = [.red, .blue, .green, .brown, .mint, .purple, .gray]
        var sampleName: [String] = []
        
        for i in 0..<num {
            circleElement.append((firstAngle, secondAngle, sampleColor[i], sampleName[i]))
            firstAngle = secondAngle
            secondAngle += tmp
        }
    }
}


// 돌림판 배치
struct Bodies: View {
    @Binding var memberCount: Int
    @Binding var myCircleElement: [(Double, Double, Color, String)]
    @State private var rotation: Double = 0.0
    var body: some View {
        VStack{
            ZStack{
                ZStack {
                    ForEach(myCircleElement, id: \.0) { item in
                        CircleMaker(initAngle: item.0, endAngle: item.1, color: item.2,
                                    names: item.3)
                    }
                }
                Image("soju")
                    .rotationEffect(.degrees(self.rotation))
                    .animation(.linear(duration: 5))
            }
            Button(action: {
                rotation = Double.random(in: 0.0...360.0)
            }){
                Text("돌리기")
            }
        }
    }

}

struct CircleMaker : View {
    var initAngle: Double
    var endAngle: Double
    var color: Color
    var names: String
    
    var midRadians: Double {
            return Double.pi / 2.0 - (initAngle + endAngle).radians / 2.0
        }
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: 180, y: 350))
                    path.addArc(center: .init(x: 180, y: 350),
                                radius: 150,
                                startAngle: Angle(degrees: initAngle),
                                endAngle: Angle(degrees: endAngle),
                                clockwise: false
                    )
                }
                Text(names)
            }
        }
    }
}
                        


struct Footer: View {
    @Binding var memberCount: Int
    @Binding var myCircleElement: [(Double, Double, Color, String)]
    
    var body : some View {
        Button(action: {
            calculate(num: memberCount)
        }){
            Text("")
        }
    }
}



//결과 및 초기화 버튼
struct DolLimPan_Previews: PreviewProvider {
    static var previews: some View {
        DolLimPan()
    }
}
