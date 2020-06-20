import SwiftUI

struct ResultView: View {
    @ObservedObject var image: InputImage
    
    var body: some View {
        VStack {
            Text("당신의 과거와 미래의 얼굴입니다.")
            if image.resultImage != nil {
                ResultScrollView(image: self.image).padding(10)
            }
            Spacer()
            Button(action: {
                self.image.next = false
            }) {
                HStack {
                    //Image(systemName: "home")
                    Text("처음으로")
                }
            }
        }
        .onAppear() {
            self.image.transform()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(image: InputImage())
    }
}
