//
//  MapTabView.swift
//  WebMapDemo
//
//  Created by 김응관 on 2022/11/02.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

var pointOfInterest = [
    AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708)),
    AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
    AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428))
]


struct MapTabView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.778457, longitude: -122.389238), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    //37.778457, -122.389238
    //위도,경도
    //배율
    
    var body: some View {
        NavigationStack {
            VStack {
                Map(coordinateRegion: $region, annotationItems: pointOfInterest) {
                    item in
                    MapMarker(coordinate: item.coordinate, tint: .purple)
                }
                //위치 추적을 위해서 Binding이 요구됨
            }
            .navigationTitle("Map")
        }
    }
}




struct MapTabView_Previews: PreviewProvider {
    static var previews: some View {
        MapTabView()
    }
}
