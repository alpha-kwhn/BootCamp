//
//  ToyShape.swift
//  Chartss
//
//  Created by 김응관 on 2022/11/17.
//

import Foundation

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

var data: [ToyShape] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 4),
    .init(type: "Pyramid", count: 4)
]
