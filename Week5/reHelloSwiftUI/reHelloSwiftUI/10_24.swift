//
//  10_24.swift
//  reHelloSwiftUI
//
//  Created by 김응관 on 2022/10/24.
//

import SwiftUI
import Combine

class DemoData: ObservableObject {
    //ObservableObject의 의미 : '이거 지켜봐줘'
    
    //다음의 값이 바뀌면 알려주겠다 -> Published의 의미
    //구체적으로 이런 내용이 바뀔예정
    @Published var userCount: Int = 0
    @Published var currentUser: String = ""
    
    init() {
        updateData()
    }
    
    func updateData() {
        userCount += 1
        currentUser = "ned"
    }
}

struct _0_24: View {
    //@ObservedObject var demoData: DemoData = DemoData()
    //알려진 값을 받아오겠다는 의미
    @ObservedObject var demoData: DemoData

    var body: some View {
        NavigationView {
            VStack{
                Text("userCount: \(demoData.userCount)")
                Text("currentUSer: \(demoData.currentUser)")
                //버튼눌러서 내부에서 값이 업데이트 되었으나
                //이곳에 반영될 방법이 없음
                
                Button(action: {
                    demoData.updateData() //업데이트
                }){
                    Text("Update data")
                }
                .padding()
                
                NavigationLink(destination:
                                SecondView()
                               //SecondView(demoData: DemoData)
                               //@ObservedObject사용의 경우
                ) {
                    Text("Push")
                        .padding()
                }
            }
            .navigationBarTitle(Text("Master"))
        }
    }
}

struct SecondView: View {
    @EnvironmentObject var demoData: DemoData
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("userCount: \(demoData.userCount)")
                Text("currentUSer: \(demoData.currentUser)")
                //버튼눌러서 내부에서 값이 업데이트 되었으나
                //이곳에 반영될 방법이 없음
                
                Button(action: {
                    demoData.updateData() //업데이트
                }){
                    Text("Update data")
                }
                .padding()
            }
            .navigationBarTitle(Text("Detail"))
        }
    }
}



//struct _0_24_Previews: PreviewProvider {
//    static var previews: some View {
//        _0_24()
//            .environmentObject(demoData: DemoData())
//    }
//}
