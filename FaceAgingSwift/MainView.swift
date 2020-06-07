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
    @State var selection: Int? = nil
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var showImagePicker: Bool = false

    var body: some View {
        NavigationView{
            VStack{
                Text("Chronoface")
                Spacer()
                if image.data != nil{
                    ConfirmView(image: self.image)
                }
                NavigationLink(destination: HelpView()) {
                    HStack {
                        Text("Help")
                    }
                }
                Spacer()
                NavigationLink(destination: ImagePicker(image: self.$image.data, isShown: self.$showImagePicker, sourceType:self.sourceType), isActive: $showImagePicker){
                    VStack{
                        Button(action: {self.selection = 1
                            self.sourceType = .photoLibrary
                            self.showImagePicker = true
                        }){
                            Text("Select a photo")
                        }
                        Button(action: {self.selection = 2
                            self.sourceType = .camera
                            self.showImagePicker = true
                        }){
                            Text("Take a Picture")
                        }
                    }
                }
            }//End of VStack
//            image?.resizable()
//            .frame(width:250, height:250)
//            .clipShape(Circle())
//            .overlay(Circle().stroke(Color.white, lineWidth: 4))
//            .shadow(radius: 10)
        }//End of NavigationView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
