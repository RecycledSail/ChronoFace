import SwiftUI

struct TransformingView: View {
    @ObservedObject var image: InputImage
    @State var timeToResult = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("얼굴 변환 중...")
                NavigationLink(destination: ResultView(image: self.image), isActive: $timeToResult){
                    EmptyView()
                }
                .onAppear() {
                    self.image.transform()
                }

            }
//            .onDisappear() {
//                self.transformImage()
//            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }    
}

struct TransformingView_Previews: PreviewProvider {
    static var previews: some View {
        TransformingView(image: InputImage())
    }
}
