import SwiftUI

struct ContentView: View {
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    
    var body: some View {
        
        NavigationView {
            List {
                //carStore안에 들어있는 배열을 ForEach로 순회
                //배열안에는 Car 객체들이 들어있음
                //각 Car 객체는 -> json에 있는 키 : 값 을 보유중
                ForEach(carStore.cars) { car in
                    ListCell(car: car)
                }
                //각 Car 객체가 가지는 값들에 접근하여 원하는 항목 출력
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewCar(carStore: self.carStore)) {
                Text("Add")
                    .foregroundColor(.blue)
                
            }, trailing: EditButton())
        }
    }
    func deleteItems(at offets: IndexSet) {
        carStore.cars.remove(atOffsets: offets)
        //뷰에서만 사라진다
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
        //destination: 몇번째(드래그앤 드롭 된 위치)
        //source: 순서가 바뀌는 Car 객체
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        NavigationLink(destination: CarDetail(selectedCar: car)) {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
