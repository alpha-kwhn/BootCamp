//
//  Environmentss.swift
//  reHelloSwiftUI
//
//  Created by 김응관 on 2022/10/24.
//

import SwiftUI

struct Environmentss: View {
    @EnvironmentObject var demoData: DemoData
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Environmentss_Previews: PreviewProvider {
    static var previews: some View {
        Environmentss()
    }
}
