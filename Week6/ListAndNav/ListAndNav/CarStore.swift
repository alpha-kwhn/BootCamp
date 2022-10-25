//
//  CarStore.swift
//  ListAndNav
//
//  Created by 김응관 on 2022/10/25.
//

import SwiftUI
import Combine

class CarStore : ObservableObject {
    @Published var cars: [Car]
    
    //[Car] 타입의 변수를 받아서 초기화 시키는 역할 -> CarStore 객체에
    //cars: [Car] = [] 이것이 @Published var cars에 담김
    init (cars: [Car] = []) {
        self.cars = cars
    }
}

