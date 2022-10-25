//
//  ThirdView.swift
//  ObservableDemo
//
//  Created by 김응관 on 2022/10/24.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var timer: TimerData
    
    var body: some View {
        Text("third timer : \(timer.timeCount)")
        
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        //ThirdView(timer: TimerData())
        ThirdView()
            .environmentObject(TimerData())
    }
}
