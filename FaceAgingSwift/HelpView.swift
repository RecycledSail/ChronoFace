import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack {
            Text("ChronoFace")
            Spacer()
            Text("ChronoFace는 머신 러닝(CAAE)을 기반으로 과거와 미래의 얼굴을 예측하는 어플리케이션입니다.")
            Text("카메라나 갤러리에서 사진을 불러온 후 얼굴 부분을 잘라서 입력하면 과거와 미래의 얼굴로 변환해서 보여줍니다.")
            Spacer()
            Spacer()
            Text("아래 예시 이미지와 같이 얼굴 부분을 잘라내면 됩니다.")
            Image("example")
                .resizable()
                .frame(width : 250, height: 250)
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
