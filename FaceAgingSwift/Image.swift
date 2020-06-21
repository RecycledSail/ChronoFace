import Foundation
import UIKit


// 이러긴 싫었다..
let imageInput:InputImage = InputImage()

class InputImage: ObservableObject {
    public init() {
        next = false
        isResult = false
        print("에이 설마...??")
    }
    @Published var next: Bool {
        didSet {
            print("next Value -> \(next)")
        }
    }
    @Published var data: UIImage? = nil
    public var resultImage: UIImage? = nil{
        didSet{
            isResult = true
        }
    }
    @Published var isResult: Bool
    
    let modelUpload = SourceUploadModel()
    let modelExec = FaceAgingExecuteModel()
    let modelResult = DownloadImage()
    
    func transform() {
        //  업로드 순서
        // 1. UIImage -> jpg 로 변환
        // 2. api 호출을 통한 서버로 업로드
        if let sourceImage = data {
            if let sourceJPG = sourceImage.jpegData(compressionQuality: 1.0) {
                // 서버로 보내볼까~
                
                modelUpload.requestToServer(sourceJPG: sourceJPG) {
                    self.modelExec.requestToServer {
                        OperationQueue.main.addOperation {
                            //self.modelResult.downloadImage()
                            //self.data = self.modelResult.image
                            self.downloadImage()
                        } 
                    }
                }
 
                //self.data = self.modelResult.getImage()
            }
        }
        // 실행 순서
        // 1. 스크립트 실행..
        
        
        sleep(UInt32(10))
        resultImage = data
    }
    func getImage(from url: URL, completion: @escaping (Data?, URLResponse?, Error?)-> ()){
           URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
           /*
           let task = URLSession(configuration: .default).dataTask(with: url) { (data, resp, err) in
               guard let data = data, err == nil else {
                   print("Fail!!!")
                   return
               }
               print(data)
               self.image = UIImage(data: data)!
           }
           task.resume()
           
           print(self.image)
    */
          // return self.image
       }
       func downloadImage()    {
           let url = URL(string: "http://104.198.63.47/http/results/test_as_male.png")!
           self.getImage(from: url){ data, resp, err in
               guard let data = data, err == nil else { return }
               print(resp?.suggestedFilename ?? url.lastPathComponent)
               DispatchQueue.main.async(){
                   self.data = UIImage(data: data)!
               }
               print(data)
           }
       }
}
