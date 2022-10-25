//
//  Car.swift
//  ListAndNav
//
//  Created by 김응관 on 2022/10/25.
//

import Foundation
import SwiftUI

//{
//    "id": "aa32jj887hhg55",
//    "name": "Tesla Model 3",
//    "description": "Luxury 4-door all-electic car. Range of 310 miles. 0-60mph in 3.2 seconds",
//    "isHybrid": false,
//    "imageName": "tesla_model_3"
//}


//json에 적힌 키 값에 알맞게 대응시킨 구조체
// Codable, Identifiable 프로토콜 준수해야 함

//Codable은 Decodable, Encodable 포함
//디코더블 : json -> 내가원하는 모델(아래의 Car 구조체)
//엔코더블 : 모델 -> json

struct Car : Codable, Identifiable {
    var id: String
    //var id: UUID() -> 얘는 목적이 아닌 '수단'
    //내용이 안겹칠 것이라는 확신을 json 파일의 Key : Value 쌍이 제공하기 때문에 굳이..쓸필요 없어보임
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
}
