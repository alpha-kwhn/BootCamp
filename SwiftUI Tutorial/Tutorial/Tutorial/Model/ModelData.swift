//
//  ModelData.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}
//더 이상 상속이 안되는 클래스를 의미


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
