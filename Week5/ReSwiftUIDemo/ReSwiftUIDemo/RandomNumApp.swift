//
//  RandomNumApp.swift
//  ReSwiftUIDemo
//
//  Created by 김응관 on 2022/10/20.
//

import SwiftUI
import Foundation

struct RandomNumApp: View {
    @State private var randomNum: Int = Int.random(in: 1..<100)
    //@State private var moreLess: Bool = true //높은 값 true, 낮은 값 false
    @State private var guessNum: String = ""
    @State private var checkNum: String = "state"
    @State private var history: [String] = ["아직 등록된 정보가 없습니다."]
    @State private var showing: Bool = false
    @State private var cnt: Int = 0
    
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack{
                    Image(checkNum).resizable()
                        .aspectRatio(contentMode: .fit)
                }
                TextField("guess a number by Zooey", text: $guessNum)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical)
                    .font(.largeTitle)
                Spacer()
                HStack(spacing: 20) {
                    Button("reset", action: {
                        checkNum = "state"
                        guessNum = ""
                        randomNum = Int.random(in: 1..<100)
                        history = []
                    })
                    .frame(width: 150)
                    .buttonStyle(.bordered)
                    .fontWeight (.bold)
                    .font (.title)
                    .padding ()
                    .foregroundColor (.white)
                    .background (Color.red)
                    .cornerRadius (10)
                    .padding(7)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(.red, lineWidth: 5))
                    
                    Button("submit", action: {
                        if guessNum.isEmpty {
                            showing = true
                            history.append("is empty")
                            return
                        } else if (Int(guessNum) ?? -1) == -1 {
                            showing = true
                            history.append("not a num")
                            return
                        } else {
                            showing = false
                            CheckNum(randomNum: $randomNum, guessNum: $guessNum,
                                     checkNum: $checkNum, history: $history).checkResult()
                        }
                    }).alert("숫자를 입력하세요", isPresented: $showing) {
                        //Button("OK", role: .cancel)
                    }
                    .frame(width: 80)
                    .buttonStyle(.bordered)
                    .fontWeight (.bold)
                    .font (.title)
                    .padding()
                    .foregroundColor (.white)
                    .background (Color.purple)
                    .cornerRadius (10)
                    .padding(7)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(.purple, lineWidth: 5))
                }
                Spacer()
                Divider()
                Text("HISTORY").frame(height:100)
                if history.count > 0 {
                    ForEach(history, id:\.self){
                        Text($0)
                    }
                } else {
                    Text("아직 입력된 값이 없습니다.")
                }
                Spacer()
            }.padding()
        }
    }
}

struct CheckNum {
    @Binding var randomNum: Int
    @Binding var guessNum: String
    @Binding var checkNum: String
    @Binding var history: [String]
    
    func checkResult() {
        if randomNum < Int(guessNum)! {
                    // 입력한 값이 현재 난수보다 클 경우
                    checkNum = "down"
                } else if randomNum > Int(guessNum)! {
                    // 입력한 값이 현재 난수보다 작을 경우
                    checkNum = "up"
                } else if randomNum == Int(guessNum)! {
                    // 입력한 값이 현재 난수와 같을 경우
                    checkNum = "bingo"
                } else {
                    // 그 외의 경우
                    checkNum = "state"
                }
        history.append("\(guessNum), \(checkNum)")
        }
}


struct RandomNumApp_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumApp()
    }
}
