//
//  ConfirmViewController.swift
//  FaceAgingSwift
//
//  Created by Abraham Park on 6/8/20.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import UIKit
import Foundation

class ConfirmViewController: UIViewController {
    var imagePicked: UIImage!
    @IBOutlet var viewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewImage.image = imagePicked
    }
}
