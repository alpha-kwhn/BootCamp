//
//  ContentView.swift
//  reHelloSwiftUI
//
//  Created by 김응관 on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    @State private var wifiEnable: Bool = false
    var body: some View {
        
    
        
        VStack {
            Toggle(isOn: $wifiEnable) {
                Text("Wi-Fi 가능한가요?")
            }

            TextField("이름을 입력하세요", text: $userName)
            //프로퍼티에 이름 저장 시 : 그 이름 출력됨
            //이름이 저장 안되어 있을 시 : placeholder ("이름입력하세요") 출력
            Text(userName)

            //하위뷰 WifiResultVie로 바인딩을 전달
            WifiResultView(wifiEnable:  $wifiEnable)
        }
        .padding()
    }
}

struct WifiResultView: View {
    //위에서 바뀐 wifiEnable 값이 @Binding을 통해 전달이 된다.
    @Binding var wifiEnable: Bool
    
    var body: some View {
        Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
        Text(wifiEnable ? "Wi-Fi 켜짐" : "Wi-Fi 꺼짐")
        //            Image(wifiEnable ? "ralo" : "kong")
        //            Text(wifiEnable ? "짠~" : "아니요")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct NameList: View {
//    var body: some View {
//        Color.pink
//            .overlay(
//            VStack {
//                Text("김도희")
//                    .modifier(Modiff())
//                Text("김보미")
//                    .modifier(Modiff())
//                Text("김응관")
//                    .modifier(Modiff())
//                Text("박성민")
//                    .modifier(Modiff())
//                Text("박훈종")
//                    .modifier(Modiff())
//                Text("유승태는 2조 조장입니다ㅏㅏㅏㅏㅏㅏㅏㅏ")
//                    .modifier(Modiff())
//                    .lineLimit(1)
//                Text("장종환")
//                    .modifier(Modiff())
//                Text("한주희")
//                    .modifier(Modiff())
//            }
//        )
//        .padding(2)
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//        .border(Color.black, width: 5)
//        //.edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct Modiff: ViewModifier {
//    func body(content: Content)-> some View {
//        content
//            .font(.largeTitle)
//            .foregroundColor(.blue)
//            .fontWeight(.bold)
//    }
//}
//
//
//struct Ex1: View {
//    var body: some View {
//        VStack(alignment: .center, spacing: 15.0) {
//            Text("판매실적")
//                .font(.title)
//                .padding(.bottom, 30.0)
//
//            HStack(alignment: .top){
//                Text("1분기 판매")
//                Spacer()
//                VStack(alignment: .trailing, spacing: 15){
//                    Text("1월")
//                    Text("2월")
//                    Text("3월")
//                        .multilineTextAlignment(.leading)
//                }
//                Spacer()
//                VStack(alignment: .trailing, spacing: 15) {
//                    Text("$1,000")
//                    Text("$200")
//                    Text("$3,000")
//                }
//
//            }
//        }
//        .padding(15)
//    }
//}
//
//struct Ex2: View {
//    var body: some View {
//        VStack {
//            Group{
//                Text("Simple Text 1")
//                Text("Simple Text 2")
//                Text("Simple Text 3")
//                Text("Simple Text 4")
//                Text("Simple Text 5")
//                Text("Simple Text 6")
//                Text("Simple Text 7")
//                Text("Simple Text 8")
//                Text("Simple Text 9")
//                Text("Simple Text 10")
//            }
//            Group {
//                Text("Simple Text 11")
//                Text("Simple Text 12")
//                Text("Simple Text 13")
//                Text("Simple Text 14")
//                Text("Simple Text 15")
//                Text("Simple Text 16")
//                Text("Simple Text 17")
//                Text("Simple Text 18")
//                Text("Simple Text 19")
//                Text("Simple Text 20")
//            }
//        }
//        //Stack안에 Group 컨테이너 2개만 들어간 것으로 인식
//        //Group컨테이너 내에서도 뷰는 10개로 제한
//        //20개의 뷰를 결론적으로 모두 집어넣기가 가능해진다
//        //Group은 묶어주는 데에 의의를 둔다
//    }
//}
//
//struct Ex3: View {
//    var body: some View {
//        HStack {
//            Image(systemName: "airplane")
//            Text("Flight times:")
//            Text("London").layoutPriority(1)
//            //뷰의 우선순위 레벨을 1로 설정
//            //짤려도 이것만은 짤리지 않게끔 설정하는 것임
//            //라인 리밋 때문에 2줄로 늘어나지도 못하는 상황
//        }
//        .font(.largeTitle)
//        .lineLimit(1)
//    }
//}
//
//struct Ex4: View {
//    var body: some View {
//                Text("Hello World, how are you? Thank you, and you?")
//                    .font(.largeTitle)
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//                //안전영역 안에서 모든 영역을 잘 활용할 수 있게 해준다
//                //.infinity : 가진 폭에서의 최대를 표현할 수 있게 해준다
//                    .border(Color.black, width: 5)
//                    .edgesIgnoringSafeArea(.all)
//                //안전영역 외의 영역까지의 활용을 허락
//                //특수한 경우에는 꼭 필요한 기능이다. (ex: 사진확대기능)
//    }
//}
//
//struct GeoEx: View {
//    var body: some View {
//        VStack{
//            Text("hi")
//                .font(.largeTitle)
//                .padding()
//            GeometryReader { geonegry in //geonegry : 리더역할
//                VStack {
//                    Text("Hello World, how are you")
//                        .font(.largeTitle)
//                        .frame(width: geonegry.size.width / 2,
//                               height: geonegry.size.height / 4 * 3)
//                    Text("Goodbye World")
//                        .font(.largeTitle)
//                        .frame(width: geonegry.size.width / 3,
//                               height: geonegry.size.height / 4)
//                }
//            }
//            .padding()
//        }
//    }
//}
