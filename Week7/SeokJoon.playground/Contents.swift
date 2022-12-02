import Foundation


// MARK: - Metro
struct Metro: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let items: Items
    let numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let subwayRouteName, subwayStationID, subwayStationName: String

    enum CodingKeys: String, CodingKey {
        case subwayRouteName
        case subwayStationID = "subwayStationId"
        case subwayStationName
    }
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String
}


let serviceKey: String = "UG69KxXXGPdg7dbdDgWlLC%2BAJYVI%2BJQehXuUcFlIi%2Fh%2FNMtOXCd6%2F5Az5bfKgknpmvc0bKT%2Ff9DwgiYZ2eVgTA%3D%3D"




func makeStringKoreanEncoded(_ string: String) -> String {
              return string.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? string
    }


let url = URL(string: "https://apis.data.go.kr/1613000/SubwayInfoService/getKwrdFndSubwaySttnList?serviceKey=\(serviceKey)&pageNo=2&numOfRows=10&_type=json&subwayStationName=\(makeStringKoreanEncoded("시청"))"
              //String Extension 방법도 있음
)!




let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let data else {
        print("데이터가 없습니다")
        return
    }
    
    guard let result = try? JSONDecoder().decode(Metro.self, from: data) else {
        print("읽어 올 수 없음")
        return
    }
    
    for station in result.response.body.items.item {
        print((station.subwayRouteName, station.subwayStationID, station.subwayStationName))
    }

}

task.resume()

