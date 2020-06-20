import SwiftUI

struct TransformingView: View {
    @ObservedObject var image: InputImage
    
    var body: some View {
        NavigationView {
            VStack {
                Text("얼굴 변환 중...")
                NavigationLink(destination: ResultView(image: self.image), isActive: self.$image.next){
                    EmptyView()
                }
            }
            .onDisappear() {
                self.transformImage()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    func transformImage() {
        sleep(UInt32(10))
        image.resultImage = image.data
    }
}

struct TransformingView_Previews: PreviewProvider {
    static var previews: some View {
        TransformingView(image: InputImage())
    }
}
