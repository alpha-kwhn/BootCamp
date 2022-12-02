//
//  Subway.swift
//  SeoulSubway
//
//  Created by 김응관 on 2022/11/22.
//

import Foundation

struct Subway: Codable, Hashable {
    var line_num: String
    var station_cd: String
    var station_nm: String
    var fr_code: String
}

class Metro: ObservableObject {
    @Published var subways: [Subway]
    
    init(subways: [Subway] = []) {
        self.subways = subways
    }
}
