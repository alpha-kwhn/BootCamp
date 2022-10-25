//
//  TimerData.swift
//  ObservableDemo
//
//  Created by 김응관 on 2022/10/24.
//

import SwiftUI
import Foundation

class TimerData : ObservableObject {
    
    //팔로잉 하고싶은 property를 published property wrapper로 선언
    @Published var timeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
            selector: #selector(timerDidFire),
            userInfo: nil,
            repeats: true)
        //시간간격 : 1.0초
        //이벤트 결과 전달 대상 : timer 자기 자신(self)
        //실행함수 : timerDidFire
        //반복여부 : true
    }
    
    //objective-C에서 만들어낸 기능이기에 @objc를 붙여줘야 한다.
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}


