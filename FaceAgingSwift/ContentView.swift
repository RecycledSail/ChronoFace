//
//  ContentView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var inMain = false
    @State var inLoading = true
    var body: some View {
        VStack{
            /*
             ContentView is a view that contains all view.
             First, declare @State var: Bool in here,
             Then Use @Binding var:Bool in desired view to act like call by reference.
             You need to declare @Environment(\.presentationMode) var pre in your view,
             Then self.pre.wrappedValue.dismiss() to end presenting your view.
             Note that you cannot use dismiss() in your body. use inside a button
             */
            if inMain{
                MainView()
            }
            else if inLoading{
                LoadingView(doneLoading: self.$inMain)
            }
            else{
                Text("Debug Screen")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
