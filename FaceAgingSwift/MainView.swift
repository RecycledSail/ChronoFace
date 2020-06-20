import SwiftUI

struct MainView: View {
    @ObservedObject var image = imageInput //InputImage()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("ChronoFace")
                Spacer()
                if image.data != nil {
                    NavigationLink(destination: ConfirmView(image: self.image), isActive: self.$image.next){
                        EmptyView()
                    }
                }
                NavigationLink(destination: HelpView()) {
                    HStack {
                        Text("도움말")
                    }
                }
                Spacer()
                HStack{
                    Button(action: {
                        self.sourceType = .photoLibrary
                        self.showImagePicker = true
                        self.image.next = true
                    }){
                        Image(systemName: "photo.fill")
                    }
                    Spacer()
                    Button(action: {
                        self.sourceType = .camera
                        self.showImagePicker = true
                        self.image.next = true
                    }){
                        Image(systemName: "camera.fill")
                    }
                }
                .font(.largeTitle).foregroundColor(.orange)
                .padding([.bottom], 10)
            }//End of VStack
            //            image?.resizable()
            //            .frame(width:250, height:250)
            //            .clipShape(Circle())
            //            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            //            .shadow(radius: 10)
            //.navigationBarTitle("Cronoface")
        }//End of NavigationView
        .padding()
        .sheet(isPresented: self.$showImagePicker){
                ImagePicker(image: self.$image.data, isShown: self.$showImagePicker, sourceType:self.sourceType)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
