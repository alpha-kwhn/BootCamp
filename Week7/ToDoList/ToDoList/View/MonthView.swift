




import SwiftUI

struct MonthView: View {

    @State private var months: String = "2022-11"
    @State private var interval: Double = 0
    //오늘 날짜에서 이제 몇일? 떨어진 날짜 표시할지 정해주는..
    @State private var now = Date()
    let formatter = DateFormatter()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Text("1")
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {}){
                            Text("Edit")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        //.principal - 중앙에 배치
                        HStack {
                            Button(action: {
                                LastMonth()
                            }){
                                Image(systemName: "arrow.left")
                            }
                            Text(months)
                            Button(action: {
                                NextMonth()
                            }){
                                Image(systemName: "arrow.right")
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {}){
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 35, height: 30)
                        }
                    }
                }
            }
        }
    }
    
    func NextMonth() {
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy-MM"
        
        interval = Double(60*60*24*30)
        now = Date(timeInterval: interval, since: now)
        
        months = formatter.string(from: now)
    }
    
    func LastMonth() {
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy-MM"
        
        interval = Double(60*60*24*30) * -1.0
        now = Date(timeInterval: interval, since: now)
        
        months = formatter.string(from: now)
    }
    
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
    }
}
