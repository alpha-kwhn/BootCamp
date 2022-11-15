//
//  SafariView.swift
//  WebMapDemo
//
//  Created by 김응관 on 2022/11/02.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable{
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        //가장 안정적인 웹 브라우저 띄우기 방법으로 권장됨
        
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        //...
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://www.apple.com/kr/")!)
    }
}
