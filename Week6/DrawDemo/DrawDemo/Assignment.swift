//
//  Assignment.swift
//  DrawDemo
//
//  Created by 김응관 on 2022/10/27.
//

import SwiftUI

struct Assignment: View {
    var body: some View {
        ZStack {
            MakeCircle(x_loc: 80, y_loc: 100).foregroundColor(.blue)
            MakeCircle(x_loc: 200, y_loc: 100).foregroundColor(.black)
            MakeCircle(x_loc: 320, y_loc: 100).foregroundColor(.red)
            MakeCircle(x_loc: 140, y_loc: 150).foregroundColor(.yellow)
            MakeCircle(x_loc: 260, y_loc: 150).foregroundColor(.green)
        }
        HStack {
            MakeStar(start_x: 200, start_y: 50, second_x: 100, second_y: 150, third_x: 350, third_y: 80, fourth_x: 50, fourth_y: 80, fifth_x: 300, fifth_y: 150).fill(.cyan)
        }
    }
}

struct MakeCircle: Shape {
    var x_loc: Int
    var y_loc: Int
    
    func path(in rect: CGRect) -> Path {
            var p = Path()
            p.addArc(center: CGPoint(x: x_loc, y:y_loc), radius: 50, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
        return p.strokedPath(.init(lineWidth: 8))
        }
}

struct MakeStar: Shape {
    var start_x: Int
    var start_y: Int
    var second_x: Int
    var second_y: Int
    var third_x: Int
    var third_y: Int
    var fourth_x: Int
    var fourth_y: Int
    var fifth_x: Int
    var fifth_y: Int
    
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: CGPoint(x: start_x, y: start_y))
        p.addLine(to: CGPoint(x: second_x, y: second_y))
        p.addLine(to: CGPoint(x: third_x, y: third_y))
        p.addLine(to: CGPoint(x: fourth_x, y: fourth_y))
        p.addLine(to: CGPoint(x: fifth_x, y: fifth_y))
        p.addLine(to: CGPoint(x: start_x, y: start_y))
        p.closeSubpath()
        
        return p
    }
}

struct MakeGraph: Shape {
    @State private var start_x: Int = 150
    @State private var start_y: Int = 100
    var bar_width: Int = 60
    var bar_height: Int = 120
    var rand_num: Int
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        var increase = Moving(start_x: $start_x, start_y: $start_y, bar_width: bar_width, bar_height: bar_height, rand_num: rand_num)
        
        p.move(to: CGPoint(x: start_x, y: start_y))
        p.addLine(to: CGPoint(x: start_x, y: 500))
        p.addLine(to: CGPoint(x: 550, y: 500))
        p.move(to: CGPoint(x: start_x, y: start_y))
        p.addLine(to: CGPoint(x: increase.moves_x(), y: start_y))
        p.addLine(to: CGPoint(x: increase.moves_x(), y: increase.moves_y()))
        p.addLine(to: CGPoint(x: increase.moves_x(), y: start_y))
        p.addLine(to: CGPoint(x: increase.moves_x(), y: 100))
        

        
        
        return p
    }
    
    mutating func add_x() {
        self.start_x = self.bar_width + self.start_x
    }
}

struct Moving {
    @Binding var start_x: Int
    @Binding var start_y: Int
    
    var bar_width: Int
    var bar_height: Int
    var rand_num: Int
    
    func moves_x() -> Int {
        start_x += bar_width
        return start_x
    }
    
    func moves_y() -> Int {
        start_y = 100
        start_y = start_y * rand_num
        return start_y
    }
}



struct Assignment_Previews: PreviewProvider {
    static var previews: some View {
        Assignment()
    }
}
