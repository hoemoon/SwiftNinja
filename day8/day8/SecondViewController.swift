//
//  SecondViewController.swift
//  day8
//
//  Created by hoemoon on 17/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var pickedImageView: UIImageView!
    
    @IBAction func loadPickerButton(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
//        pickerController.allowsEditing = false
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self


        present(pickerController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            pickedImageView.image = image as? UIImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

