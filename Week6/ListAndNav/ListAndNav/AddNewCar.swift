//
//  AddNewCar.swift
//  ListAndNav
//
//  Created by 김응관 on 2022/10/25.
//

import SwiftUI

struct AddNewCar: View {
    
    @ObservedObject var carStore: CarStore
    
    @State var isHybrid = false
    @State var name: String = ""
    @State var description: String = ""
    //SSOT 근거해
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                    
                }.padding()
            }
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString,
                      name: name, description: description,
                      isHybrid: isHybrid, imageName: "tesla_model_3" )
        
        carStore.cars.append(newCar)
    }
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    //이왜진?
    //바인딩 값을 받아옴 근데 우리는 이것을 그냥 userInput라는 이름으로 연결을 지어준다!!
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}



struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar(carStore: CarStore(cars: carData))
    }
}
