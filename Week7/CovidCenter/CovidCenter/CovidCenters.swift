//
//  CovidCenters.swift
//  CovidCenter
//
//  Created by 김응관 on 2022/11/22.
//

import Foundation

struct CovidCenters: Codable, Hashable {
    var currentCount: Int
    var data: [CovidCenter]
    var matchCount: Int
    var page: Int
    var perPage: Int
    var totalCount: Int
}

struct CovidCenter: Codable, Hashable {
    var address: String
    var centerName: String
    var centerType: String
    var sido: String
}

class CovidCenterStore : ObservableObject {
    
    @Published var centers: [CovidCenter]
    
    init (centers: [CovidCenter] = []) {
        self.centers = centers
    }
}


