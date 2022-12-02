//
//  NetworkError.swift
//  SpotifyAPI
//
//  Created by 김응관 on 2022/11/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse
    case generalError
}
