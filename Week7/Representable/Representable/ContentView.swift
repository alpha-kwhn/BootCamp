//
//  ContentView.swift
//  Representable
//
//  Created by 김응관 on 2022/11/02.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack{
            MyUILabel(text: "Hello UIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
