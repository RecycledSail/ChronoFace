//
//  MainView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var image: Image?
    @State var selection: Int? = nil
    var body: some View {
        NavigationView{
            VStack{
                Text("Chronoface")
                Spacer()
                NavigationLink(destination: LibraryView(), tag: 1, selection: $selection){
                    Button(action: {self.selection = 1}){
                        Text("Select a photo")
                    }
                }
                Spacer()
            }//End of VStack
            image?.resizable()
            .frame(width:250, height:250)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        }//End of NavigationView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
