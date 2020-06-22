import SwiftUI

struct ResultView: View {
    @ObservedObject var image: InputImage
    
    var body: some View {
        VStack {
            if image.resultImage != nil {
                Text("당신의 과거와 미래의 얼굴입니다.")

                ResultScrollView(image: self.image).padding(10)
                Spacer()
                Button(action: {
                    self.image.next = false
                    self.image.resultImage = nil
                }) {
                    HStack {
                        //Image(systemName: "home")
                        Text("처음으로")
                    }
                }
            }
            else {
                Text("얼굴 변환 중...")
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
