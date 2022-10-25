//
//  ContentView.swift
//  ObservableDemo
//
//  Created by 김응관 on 2022/10/24.
//

import SwiftUI
//import Combine

//EnvironmentObject를 최소한으로 쓸 수 있도록 노력해야 함
//State -> ObrservedObject -> EnvironmentObject

//단순하게 한 화면에서 입력값을 받아 처리 -> State
//이어지는 화면에 걸쳐서 넘기고 영향을 받아야 한다면 -> Observable
//거의 모든 화면에 걸치는 데이터라면 -> Environment

struct ContentView: View {
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: {
                    timerData.resetCount()
                }) {
                    Text("Reset Counter")
                }
                NavigationLink(destination:
                                SecondView()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView(timerData: TimerData())
        ContentView()
            .environmentObject(TimerData())
    }
}
