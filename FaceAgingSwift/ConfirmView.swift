import SwiftUI

struct ConfirmView: View {
    @ObservedObject var image: InputImage
    var body: some View {
        VStack {
            Spacer()
            Text("Is this your face?")
            Image(uiImage: image.data!)
                .resizable()
                .frame(width : 250, height: 250)
            Spacer()
            Button(action: {}) {
                Text("Yes")
            }
            Button(action: {}) {
                Text("Select Again")
            }
            Spacer()
        }
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(image: InputImage())
    }
}
