//
//  LoadingView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State var isActive = false
    
    var body: some View {
        VStack{
            if self.isActive == true{
                MainView()
            }
            else{
                Text("Loading...")
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
