import Foundation
import UIKit

class InputImage: ObservableObject {
    public init() {
        
    }
    @Published var data: UIImage? = nil
    @Published var resultImage: UIImage? = nil
    
    func doSomething() {
        print("되냐?")
    }
}
