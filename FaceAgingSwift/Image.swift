import Foundation
import UIKit

class InputImage: ObservableObject {
    public init() {
        
    }
    @Published var next: Bool = false
    @Published var data: UIImage? = nil
    @Published var resultImage: UIImage? = nil
    
    func transform() {
        sleep(UInt32(10))
        resultImage = data
    }
}
