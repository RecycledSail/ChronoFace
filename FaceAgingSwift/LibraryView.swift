//
//  LibraryView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct LibraryView: View {
    @Binding var image : UIImage?
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var showImagePicker: Bool = false

    var body: some View {

        ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType:self.sourceType)
            .sheet(isPresented: self.$showImagePicker){
                Image(uiImage: self.image!)
                .resizable()
                .frame(width: 250, height : 250)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(image: .constant(UIImage()))
    }
}
