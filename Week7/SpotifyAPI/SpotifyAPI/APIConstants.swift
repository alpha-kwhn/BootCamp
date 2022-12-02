//
//  APIConstants.swift
//  SpotifyAPI
//
//  Created by 김응관 on 2022/11/22.
//

import Foundation

enum APIConstants {
    static let clientId = "3b80451b574a4b50826dacc8ed9a28a5"
    static let apiHost = "api.spotify.com"
    static let authHost = "accounts.spotify.com"
    static let clientSecret = "d17150ac284847b8a62477134ffbef4b"
    static let redirectUri = "https://oauth.pstmn.io/v1/browser-callback"
    static let responseType = "token"
    static let scopes = "playlist-modify-public playlist-read-private playlist-modify-private"
    
    static var authParams = [
        "response_type": responseType,
        "clinet_id": clientId,
        "redirect_uri": redirectUri,
        "scope": scopes
    ]
}
