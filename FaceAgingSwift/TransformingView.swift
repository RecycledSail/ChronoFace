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
//        let fileurl: URL = {
//            let filepath = image
//            return URL(fileURLWithPath: filepath)
//        }()
        let serverURL = URL(string:"http://localhost:3378/upload")!
        let request: URLRequest = {
           // 헤더에 포함시키기 위한 파일 이름은 파일의 URL로부터 구할 수 있다.
//           let filename = fileURL.lastPathComponent
        let filename = "senderface"
           var req = URLRequest(url: serverURL)
           req.httpMethod = "POST"
           req.addValue("attachment; filename=\"\(filename)\";",
                 forHTTPHeaderField: "Content-Disposition")
           return req
        }()
          let data = Data((image.data?.jpegData(compressionQuality: 0.9))! )
          let session = URLSession.shared
          let task = session.uploadTask(with: request, from: data) { data, res, error in
            /// 1: 실제로 비동기로 동작하는 업로드 동작 때문에, 완료핸들러의 처리 후에는
            //     런루프를 멈춰서 프로그램이 종료할 수 있게 해주어야 한다.
            defer {
              CFRunLoopStop(CFRunLoopGetMain())
            }
            // 에러 체크
            guard error == nil else {
              print("Error: \(error!.localizedDescription)")
              return
            }
            // 서버로부터 응답이 제대로 내려왔는지 체크
            // 응답값은 URLResponse? 인데,
            // 이를 HTTPURLResponse로 캐스팅해서 statusCode를 확인한다.
            if let res = res as? HTTPURLResponse,
                res.statusCode != 200 {
               print("Server failed")
            }
            if let data = data, let message = String(data:data, encoding:.utf8)
            {
               print(message)
            }
          }
          // 업로드 시작
          task.resume()
          // 위 함수는 non-blocking이기 때문에
          // 런루프를 돌려서 대기해야 한다.
          CFRunLoopRun()
        sleep(UInt32(10))
        image.resultImage = image.data
    }
    
}

struct TransformingView_Previews: PreviewProvider {
    static var previews: some View {
        TransformingView(image: InputImage())
    }
}
