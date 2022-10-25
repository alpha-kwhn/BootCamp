//
//  ObservableDemoApp.swift
//  ObservableDemo
//
//  Created by 김응관 on 2022/10/24.
//

import SwiftUI

@main
struct ObservableDemoApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView(timerData: TimerData())
            ContentView().environmentObject(TimerData())
        }
    }
}
