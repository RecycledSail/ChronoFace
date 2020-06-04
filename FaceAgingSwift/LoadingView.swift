//
//  LoadingView.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/04.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    //Variable declearation
    @Environment(\.presentationMode) var pre
    @Binding var doneLoading: Bool
    
    //Start of Body
    var body: some View {
        VStack{
            Text("Loading...")
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                withAnimation{
                    self.doneLoading = true
                    self.pre.wrappedValue.dismiss()
                }
            }
        }
    }//End of Body
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(doneLoading: .constant(false))
    }
}
