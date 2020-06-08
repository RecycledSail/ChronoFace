//
//  FirstViewController.swift
//  FaceAgingSwift
//
//  Created by Abraham Park on 6/8/20.
//  Copyright © 2020 Lim Jun Young. All rights reserved.
//

import UIKit
import Foundation

class FirstViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicked: UIImage?
    
    @IBAction func touchLibrary() {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        picker.delegate = self
        
//        self.navigationController?.pushViewController(picker, animated: true)
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.imagePicked = info[.editedImage] as? UIImage
        
        picker.dismiss(animated: true) {
            self.performSegue(withIdentifier: "toConfirm", sender: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ConfirmViewController
        
        dest.imagePicked = imagePicked
    }
}
