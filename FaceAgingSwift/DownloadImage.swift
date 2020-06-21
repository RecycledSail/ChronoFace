//
//  DownloadImage.swift
//  FaceAgingSwift
//
//  Created by #include on 2020/06/21.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import Foundation
import UIKit

class DownloadImage {
    private var image: UIImage?
    func getImage() -> UIImage? {
        let url = URL(string: "http://104.198.63.47/http/results/test_as_male.png")!
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
        return self.image
    }
}
