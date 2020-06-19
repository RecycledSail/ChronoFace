import SwiftUI

struct ConfirmView: View {
    @Environment(\.presentationMode) var pre
    @ObservedObject var image: InputImage
    
    var body: some View {
        VStack {
            Spacer()
            Text("Is this your face?")
            Image(uiImage: image.data!)
                .resizable()
                .frame(width : 250, height: 250)
            Spacer()
            Button(action: {
                self.image.doSomething()
            }) {
                Text("Yes")
            }
            Button(action: {
                self.pre.wrappedValue.dismiss()
            }) {
                Text("Select Again")
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: Button("다시 선택") {
//
//        })
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(image: InputImage())
    }
}
