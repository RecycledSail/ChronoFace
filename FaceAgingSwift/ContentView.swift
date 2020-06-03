//
//  ContentView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/05/25.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var image: Image?
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var showSheet : Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Button(action:{
                    self.showSheet = true
                    self.sourceType = .photoLibrary
                }){
                    Text("Select a photo")
                }
                image?.resizable()
                    .frame(width:250, height:250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }
        }.sheet(isPresented: $showSheet){
            ImagePicker(image: self.$image, sourceType:self.sourceType)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
