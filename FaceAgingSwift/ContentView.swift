//
//  ContentView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/05/25.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var image: Image? = nil
    
    var body: some View {
        ZStack{
            VStack{
                Button(action:{}){
                    Text("Select a photo")
                }
                image?.resizable()
                    .frame(width:250, height:250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
