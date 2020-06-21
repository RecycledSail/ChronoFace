//
//  SourceUploadModel.swift
//  FaceAgingSwift
//
//  Created by Abraham Park on 6/21/20.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import Foundation

class SourceUploadModel {
    
    /// 호출시 서버로 전송.
    func requestToServer(sourceJPG:Data, closureNextProc:@escaping () -> Void) {
        
        let session = URLSession(configuration: .default)
        
        let stringURL = "http://222.232.163.198/php/upload.php"
        let url = URL(string: stringURL)!
        var request = URLRequest(url: url)
        let boundary = "Boundary-\(UUID().uuidString)"
        
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let httpBody = NSMutableData()
        
        httpBody.append(convertFileData(fieldName: "sourceImage",
                                        fileName: "sourceImage.jpg",
                                        mimeType: "image/JPEG",
                                        fileData: sourceJPG,
                                        using: boundary))

        httpBody.appendString("--\(boundary)--")

        request.httpBody = httpBody as Data

//        print(String(data: httpBody as Data, encoding: .utf8)!)
        
        request.httpMethod = "POST"

        let task = session.dataTask(with: request) { (data, resp, err) in
            print(String(data: data!, encoding: .utf8))
            print("hmm")
            closureNextProc() // 다음 작업을 호출
        }

        task.resume()
        
//        print(NSHomeDirectory())
//        try! sourceJPG.write(to: URL(fileURLWithPath: NSHomeDirectory() + "/Documents/IU.jpg"))
    }
    func convertFormField(named name: String, value: String, using boundary: String) -> String {
      var fieldString = "--\(boundary)\r\n"
      fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
      fieldString += "\r\n"
      fieldString += "\(value)\r\n"

      return fieldString
    }
    
    func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {
      let data = NSMutableData()

      data.appendString("--\(boundary)\r\n")
      data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n")
      data.appendString("Content-Type: \(mimeType)\r\n\r\n")
      data.append(fileData)
      data.appendString("\r\n")

      return data as Data
    }
}

extension NSMutableData {
  func appendString(_ string: String) {
    if let data = string.data(using: .utf8) {
      self.append(data)
    }
  }
}
