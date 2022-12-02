//
//  ContentView.swift
//  SeoulSubway
//
//  Created by 김응관 on 2022/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var subways: Metro = Metro(subways: [])
    @State private var progress = 0.5
    let seconds = 4.0
    
    var webService: WebService = WebService()
    
    let url: String = "https://mocki.io/v1/d951d667-2cff-4b4b-81ac-932224f85eaa"
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .center) {
                if subways.subways.count < 1 {
                    ProgressView()
                }
            }
            List {
                ForEach(subways.subways, id:\.self) { item in
                    Text("\(item.line_num)")
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    Task {
                        subways.subways = try! await webService.fetchData(url: url)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
