//
//  ContentView.swift
//  DrawDemo
//
//  Created by 김응관 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.largeTitle)
            Rectangle()
            
            Text("Hello, world!")
                .font(.largeTitle)
            
            Circle()
                .fill(Color.red)
            //색채우기는 무조건 fill, foregroundColor는 strokeColor에 보통 사용
                .overlay (
                    Ellipse().stroke(Color.blue, lineWidth: 10)
                )
                .frame(width: 100, height: 240)
            
            Text("Hello Capsule")
                .font(.largeTitle)
            Capsule() //타원, 다이나믹아일랜드
                .stroke(lineWidth: 10) //테두리 두꼐
                .foregroundColor(.blue) //테두리 색상
                .frame(width: 200, height: 100)
            
            Text("Hello RoundedRectangle")
            RoundedRectangle(cornerRadius: CGFloat(20))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(8), dash: [CGFloat(10), CGFloat(5)])) //10단위로 찍고 5단위로 공백을 만들어준다는 의미임
            //둥근모서리직사각형
            
            Text("Hello Ellipse")
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 20, dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(10)))
                .foregroundColor(.blue)
                .frame(width: 250, height: 150)
        }
        .padding()
    }
}

struct paths: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 10, y: 0))
                path.addLine(to: CGPoint(x: 10, y: 310))
                path.addLine(to: CGPoint(x: 300, y: 310)) //가로 x, 세로 y축
                path.closeSubpath()
            }
            .fill(Color.green)
            
            MyShape()
                .fill(.purple)
        }
    }
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //도형 정의 코드
        path.move(to: CGPoint(x: 10, y: 0))
        path.addLine(to: CGPoint(x: 10, y: 310))
        path.addLine(to: CGPoint(x: 300, y: 310)) //가로 x, 세로 y축
        path.closeSubpath()
        
        return path
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        paths()
    }
}
