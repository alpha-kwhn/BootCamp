//
//  LandmarkRow.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import SwiftUI

struct LandmarkRow: View {
    //Landmark 객체 초기화를 해주어야 함
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text("\(landmark.name)")
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding()
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        LandmarkRow(landmark: landmarks[1])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
