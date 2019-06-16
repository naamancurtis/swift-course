//
//  ViewController.swift
//  SeeFoodWatson
//
//  Created by Naaman Curtis on 16/06/2019.
//  Copyright © 2019 Naaman Curtis. All rights reserved.
//

import UIKit
import VisualRecognition
import SVProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    private let imagePicker = UIImagePickerController()
    private let apiKey = "Sz_ELeMHwhLBgzpjNs1UrF4gD1J09AQLDQN_em7e93uc"
    private let version = "2019-06-14"
    private var classificationResults: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func cameraButton(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cameraButton.isEnabled = false
        SVProgressHUD.show()
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            classificationResults = []
            
            imageView.image = pickedImage
            imagePicker.dismiss(animated: true, completion: nil)
            
            let visualRecognition = VisualRecognition(version: version, apiKey: apiKey)
            let imageData = pickedImage.jpegData(compressionQuality: 0.01)
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("tempImage.jpg")
            try? imageData?.write(to: fileURL)
            
            visualRecognition.classify(imagesFile: fileURL) { (classifiedImages) in
                let classes = classifiedImages.images.first!.classifiers.first!.classes
                for index in 0..<classes.count {
                    self.classificationResults.append(classes[index].className)
                }
                DispatchQueue.main.async {
                    self.navigationItem.title = self.classificationResults.first
                    self.cameraButton.isEnabled = true
                    SVProgressHUD.dismiss()
                }
            }
        } else {
            print("There was an error picking the image")
            self.cameraButton.isEnabled = true
            SVProgressHUD.dismiss()
        }
        
    }
}
