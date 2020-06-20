import SwiftUI

struct ResultScrollView: View {
    @ObservedObject var image: InputImage
    
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: true) {
            VStack {
                Image(uiImage: image.resultImage!)
                .resizable()
                .frame(width: 250, height: 2500)
            }
        }
    }
}

struct ResultScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ResultScrollView(image: InputImage())
    }
}
