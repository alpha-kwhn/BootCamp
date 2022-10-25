//
//  CarData.swift
//  ListAndNav
//
//  Created by 김응관 on 2022/10/25.
//

import UIKit
import SwiftUI

//decoding 함수를 활용하여 josn 파일을 parsing하고
//carData라는 Car타입의 배열에 넣어준다
//Car 구조체 형식에 맞게 값들이 매칭되어 각각의 구조체 객체가 형성되어 차곡차곡 쌓임..?
var carData: [Car] = loadJson("carData.json")


//국-룰 -> Define data json decoding function
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename,
                        withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): (error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): (error)")
    }
}
