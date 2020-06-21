//
//  FaceAgingExecuteModel.swift
//  FaceAgingSwift
//
//  Created by Abraham Park on 6/21/20.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import Foundation

class FaceAgingExecuteModel {
    func requestToServer(closureNextProc:@escaping () -> Void) {
        let url = URL(string: "http://104.198.63.47/http/execute.php")!
        let task = URLSession(configuration: .default).dataTask(with: url) { (data, resp, err) in
            print(String(data: data!, encoding: .utf8))
            closureNextProc()
        }
        task.resume()
    }
}
