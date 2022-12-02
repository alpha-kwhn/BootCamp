//
//  TutorialApp.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import SwiftUI

@main //진입점 - 앱에서 어디부터 실행할지 지정해주는 부분
struct TutorialApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        //App -> Scene (단위순서)
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
