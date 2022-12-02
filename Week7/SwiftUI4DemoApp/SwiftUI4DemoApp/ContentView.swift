//
//  ContentView.swift
//  SwiftUI4DemoApp
//
//  Created by 김응관 on 2022/11/15.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var previousNumbers = [3, 6, 9]
    
    var body: some View {
        
        NavigationStack(path: $previousNumbers) {
            NavigationLink(value: 369) {
                Text("CEO")
            }
            
            List(1..<30) { index in
                NavigationLink(value: index) {
                    Label("Employee No.\(index)", systemImage: "\(index).square")
                }
                
            }
            .navigationDestination(for: Int.self) {
                index in Text("Hello \(index)")
            }
            .navigationDestination(for: String.self) { name in
                Text("CEO \(name)")
            }
            .navigationTitle("apss")
            GridView()
        }
        
    }
}

struct GridView: View {
    @State private var kScore: Int = 0
    @State private var uScore: Int = 0
    
    var body: some View {
        Grid {
            GridRow {
                Text("Korea")
                
                ForEach(0..<kScore, id:\.self) { _ in
                    Circle()
                        .fill(.red)
                        .frame(width:20, height: 20)
                }
            }
            
            GridRow {
                Text("Uruguay")
                
                ForEach(0..<uScore, id: \.self) { _ in
                    Circle()
                        .fill(.blue)
                        .frame(width:20, height: 20)
                    
                }
            }
            
            Button("Korea") {kScore += 1}
            Button("Uruguay") {uScore += 1}
        }
    }
}

struct SheetView: View {
    @State private var showingSheet = false
    var body: some View {
        VStack {
            Button("Show sheet") {
                showingSheet.toggle()
            }
        }
        .sheet(isPresented: $showingSheet) {
            Text("This is sheet")
                .presentationDetents([.height(100), .fraction(0.35), .medium, .large])
                .presentationDragIndicator(.hidden)
            //sheet가 절반 까지만 올라온다
        }
    }
}

struct ShareView: View {
    private let url = URL(string: "https://likelion.net")!
    private let photo = SharingPhoto(image: Image(systemName: "star.fill"), caption: "This is a star")
    
    var body: some View {
        VStack {
            ShareLink(item: url) {
                Label("Share", systemImage: "link.icloud")
                    .font(.largeTitle)
            }
            //셰어링크는 SheetView를 포함하고 있음
            //.presentationDetents([.medium, .large])
            Divider()
            
            photo.image
                .font(.largeTitle)
            ShareLink(item: photo, subject: Text("Star Photo"), message: Text("Check it out!"), preview: SharingPhoto(photo.caption, image: photo.image))
                .font(.largeTitle)
                    
            
            Divider()
        }
    }
}

struct SharingPhoto: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
    
    public var image: Image
    public var caption: String
}

struct Mains: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    ShareView()
                } label: {
                    Label("Share Link View ", systemImage: "square.and.arrow.up")
                }
                
            }
        }
    }
}

struct PhotosUIView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack {
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared())
            {
                Text("Select a photo")
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await
                        newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
