//
//  WebTabView.swift
//  WebMapDemo
//
//  Created by 김응관 on 2022/11/02.
//

import SwiftUI

struct WebTabView: View {
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                isShowingSheet.toggle()
            }){
                Text("Hello Web")
            }
            //sheet를 통해 Modal View 구현 가능
        }
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss) {
            
            SafariView(url: URL(string: "https://www.apple.com/kr/")!)
        }
    }
    
    func didDismiss() {
        
    }
}

struct WebModalView: View {
    var body: some View {
        Text("Hello")
    }
}


struct WebTabView_Previews: PreviewProvider {
    static var previews: some View {
        WebTabView()
    }
}
