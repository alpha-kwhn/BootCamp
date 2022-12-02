//
//  loadJson.swift
//  SeoulSubway
//
//  Created by 김응관 on 2022/11/22.
//

import Foundation

class WebService {
    func fetchData(url: String) async throws -> [Subway] {
        guard let url = URL(string: url) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let metros = try JSONDecoder().decode([Subway].self, from: data)
        
        return metros
    }
}
