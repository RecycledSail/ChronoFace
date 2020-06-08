import Foundation
import UIKit

class InputImage: ObservableObject {
    public init() {
        
    }
    @Published var data: UIImage? = nil {
        didSet {
            print("hoho?")
            // 로컬에 파일을 저장. png jpg
        }
    }
}
