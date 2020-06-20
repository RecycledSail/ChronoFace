import SwiftUI

struct ConfirmView: View {
    @ObservedObject var image: InputImage
    @State var doTransform: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                if doTransform {
                    NavigationLink(destination: TransformingView(image: self.image), isActive: self.$image.next) {
                        EmptyView()
                    }
                }
                Text("당신의 얼굴이 맞습니까?")
                Image(uiImage: image.data!)
                    .resizable()
                    .frame(width : 250, height: 250)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.doTransform = true
                    }) {
                        Text("확인")
                    }
                    Spacer()
                    Button(action: {
                        self.image.next = false
                    }) {
                        Text("다시 선택")
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(image: InputImage())
    }
}
