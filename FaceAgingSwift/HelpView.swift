import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack {
            Text("ChronoFace")
            Text("(app explanation)")
            Spacer()
            Text("Here is the example of cropping image.")
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
