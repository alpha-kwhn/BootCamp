//
//  SecondView.swift
//  ObservableDemo
//
//  Created by 김응관 on 2022/10/24.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var timerData: TimerData
    //=TimerData() --> 새로운 timerData를 정의해주기 때문에 앞에 뷰랑 tiemrCount가 달라진다
    var body: some View {
        NavigationView{
            VStack {
                Text("Second View")
                    .font(.largeTitle)
                Text("Timer Count = \(timerData.timeCount)")
                    .font(.headline)
                Button(action: {
                    timerData.resetCount()
                }) {
                    Text("Reset Counter")
                }
                NavigationLink(destination: //ThirdView(timer: timerData))
                    ThirdView())
                               {
                               
                    Text("Next")
                }
            }
            .padding()
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .environmentObject(TimerData())
    }
}
