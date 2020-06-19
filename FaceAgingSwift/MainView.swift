//
//  MainView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var image = InputImage()
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var showImagePicker: Bool = false
    @State var next : Bool = false

    var body: some View {
        NavigationView{
            VStack{
                Text("Chronoface")
                Spacer()
                if image.data != nil{
                    NavigationLink(destination: ConfirmView(image: self.image), isActive: $next){
                        EmptyView()
                    }
                }
                NavigationLink(destination: HelpView()) {
                    HStack {
                        Text("Help")
                    }
                }
                Spacer()
                    VStack{
                        Button(action: {
                            self.sourceType = .photoLibrary
                            self.showImagePicker = true
                            self.next = true
                        }){
                            Text("Select a photo")
                        }
                        Button(action: {
                            self.sourceType = .camera
                            self.showImagePicker = true
                            self.next = true
                        }){
                        Text("Take a Picture")
                    }
                }
            }//End of VStack
//            image?.resizable()
//            .frame(width:250, height:250)
//            .clipShape(Circle())
//            .overlay(Circle().stroke(Color.white, lineWidth: 4))
//            .shadow(radius: 10)
        }//End of NavigationView
            .sheet(isPresented: self.$showImagePicker){
                ImagePicker(image: self.$image.data, isShown: self.$showImagePicker, sourceType:self.sourceType)
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
