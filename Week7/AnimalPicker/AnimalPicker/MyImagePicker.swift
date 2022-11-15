//
//  MyImagePicker.swift
//  AnimalPicker
//
//  Created by 김응관 on 2022/11/02.
//

import Foundation
import SwiftUI

struct MyImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: Image?
    @Binding var imagePickerVisible: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyImagePicker>)-> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MyImagePicker>){
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(selectedImage: $selectedImage, imagePickerVisible: $imagePickerVisible)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var selectedImage: Image?
        @Binding var imagePickerVisible: Bool
        
        init(selectedImage: Binding<Image?>, imagePickerVisible: Binding<Bool>) {
            _selectedImage = selectedImage
            _imagePickerVisible = imagePickerVisible
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            selectedImage = Image(uiImage: image)
            imagePickerVisible = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            imagePickerVisible = false
        }
    }
}
