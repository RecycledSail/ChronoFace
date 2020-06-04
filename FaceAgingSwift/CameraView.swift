//
//  CameraView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    @Binding var image : UIImage?
    @State private var sourceType : UIImagePickerController.SourceType = .camera
    @State private var showImagePicker: Bool = false

    var body: some View {

        ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType:self.sourceType)
        }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(image: .constant(UIImage()))
    }
}
