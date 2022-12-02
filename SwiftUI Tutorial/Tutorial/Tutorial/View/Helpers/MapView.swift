//
//  MapView.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    //사각형 맵뷰 (설정 위도/경도 기반위치가 중앙에 나타남)
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286 , longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $region)
        //위치 바뀌면 알아서 새로운 위치적용해서 지도에 나타내주기 위해 Binding 값을 사용함
            .onAppear {
                setRegion(coordinate)
            }
        
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286 , longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
