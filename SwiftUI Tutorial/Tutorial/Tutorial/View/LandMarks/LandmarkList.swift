//
//  LandmarkList.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly:
        Bool = false
    
    var filteredLandmarks: [Landmark] {
        get {
            return modelData.landmarks.filter { landmark in
               let result = (!showFavoritesOnly || landmark.isFavorite)
                return result
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) {
                    landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 14 Pro"], id:\.self) { devicename in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: devicename))
        }
    }
}
