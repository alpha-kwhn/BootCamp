//
//  LandmarkDetail.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
            //y축 좌표 위치이동
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    //좌우 or 위아래의 뷰끼리의 폭을 최대한으로 잡아먹어준다
                    Text(landmark.state)
                        
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[1])
            .environmentObject(modelData)
    }
}
