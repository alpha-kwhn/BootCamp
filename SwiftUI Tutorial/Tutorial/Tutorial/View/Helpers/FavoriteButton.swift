//
//  FavoriteButton.swift
//  Tutorial
//
//  Created by 김응관 on 2022/11/25.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var buttonColor: Color {
        get {
            return isSet ? .yellow : .gray
        }
    }
    var buttonImage: String {
        get {
            return isSet ? "star.fill" : "star"
        }
    }
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: buttonImage)
                .labelStyle(.iconOnly)
            //접근성을 위해 아이콘만, 시각장애인은 소리로 들어야하니까
                .foregroundColor(buttonColor)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
