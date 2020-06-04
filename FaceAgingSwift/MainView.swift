//
//  MainView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Binding var isCamera: Bool
    @Binding var isGallery: Bool
    var body: some View {
        VStack{
            Text("Chronoface")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isCamera: .constant(false), isGallery: .constant(false))
    }
}
