//
//  LibraryView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct LibraryView: View {
    @State var image : Image?
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary

    var body: some View {

        ImagePicker(image: self.$image, sourceType:self.sourceType)

    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
