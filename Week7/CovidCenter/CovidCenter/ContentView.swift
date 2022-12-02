//
//  ContentView.swift
//  CovidCenter
//
//  Created by 김응관 on 2022/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var covidCenterStore: CovidCenterStore = CovidCenterStore(centers: [])
    
    var webService: WebService = WebService()
    
    let url: String = "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=10&serviceKey=IqV8U3oL39Xq5A1gSbKYKHnRESAPgGu397bHbKxmiAlqiHoR1Zkf5yNLne8Xtc%2B9MEt8XKceRDvE%2F%2Bu4%2Fn6rbQ%3D%3D"
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(covidCenterStore.centers, id:\.self) { center in
                        VStack(alignment: .leading) {
                            Text("\(center.centerName)")
                                .font(.headline)
                            Text("\(center.address)")
                                .font(.subheadline)
                        }
                    }
                    
                }
                
                VStack {
                    Image(systemName: "stethoscope.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .font(.largeTitle)
                    
                    Button("Fetch Data") {
                        Task {
                            covidCenterStore.centers = try await webService.fetchData(url: url)
                        }
                    }
                }
            }
            .navigationTitle("COVID-19 Centers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

