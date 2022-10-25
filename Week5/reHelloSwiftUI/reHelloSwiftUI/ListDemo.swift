//
//  ListDemo.swift
//  reHelloSwiftUI
//
//  Created by 김응관 on 2022/10/25.
//

import SwiftUI

struct ToDoItem: Identifiable {
    var id = UUID()
    //옛날에는 기기별 일련번호를 끄집어내서
    
    var task: String
    var imageName: String
}

var listData: [ToDoItem] = [
    ToDoItem(task: "Wash the car", imageName: "car.fill"),
    
    ToDoItem(task: "Vacuum house", imageName: "house.fill"),
    ToDoItem(task: "Pick up kids from school bus @ 3pm", imageName: "bus.doubledecker"),
    ToDoItem(task: "Auction the kids on ebay", imageName: "cart.fill"),
    ToDoItem(task: "Order Pizza for dinner", imageName: "fork.knife")
]

struct ListDemo: View {
    @State private var toggleStatus = true
    
    var body: some View {
        NavigationView {
            //화면 전환대상 범위 설정
            List {
                Section(header: Text("settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notification")
                    }
                }
                
                Section(header: Text("To Do Tasks")){
                    ForEach(listData) { item in
                        //하나씩 끄집어 내서 보여주는 경우
                        //Identifier 프로토콜을 준수하고, UUID()를 가지는 id 생성필요
                        NavigationLink (destination: Text(item.task)){
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
            }.listStyle(.plain)
                .navigationTitle(Text("To do List"))
                .navigationBarItems(trailing: EditButton())
//                .navigationBarItems(leading: View, trailing: Button(action: {
//                    print("Hello")
//                }))
        }
            
//        List(listData) { item in
//            HStack {
//                Image(systemName: item.imageName)
//                Text(item.task)
//                Text("\(item.id)")
//            }
 //       }.listStyle(.plain)
        //10개 이하의 데이터를 가져야 한다
    }
}

func deleteItem(at offset: IndexSet) {
    print("indexSet: \(offset)")
    //listData.remove(at: offset.)
}

func moveItem(from source: IndexSet, to destination: Int) {
    print("source: \(source)")
    print("destination: \(destination)")
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}
