import Foundation
import UIKit


// 이러긴 싫었다..
let imageInput:InputImage = InputImage()

class InputImage: ObservableObject {
    public init() {
        next = false
        print("에이 설마...??")
    }
    @Published var next: Bool {
        didSet {
            print("next Value -> \(next)")
        }
    }
    @Published var data: UIImage? = nil
    @Published var resultImage: UIImage? = nil
    
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
                            self.data = self.modelResult.getImage()
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
}
