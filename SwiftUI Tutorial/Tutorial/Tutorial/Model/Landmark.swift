//
//  Landmark.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import Foundation
import SwiftUI
import MapKit

struct Landmark: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    
    var image: Image {
        get {
            return Image(imageName)
        }
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        }
    }
}
