//
//  loadJson.swift
//  CovidCenter
//
//  Created by 김응관 on 2022/11/22.
//

import Foundation

func loadJson<T: Decodable>(data: Data) -> T {
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse data: \(error)")
    }
}
