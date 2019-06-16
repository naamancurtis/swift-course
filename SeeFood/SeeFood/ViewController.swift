//
//  ViewController.swift
//  SeeFood
//
//  Created by Naaman Curtis on 16/06/2019.
//  Copyright © 2019 Naaman Curtis. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {
    private let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }

    @IBAction func cameraTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        do {
            let model = try VNCoreMLModel(for: MobileNetV2().model)
            let request = VNCoreMLRequest(model: model) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else { fatalError("Error in model processing image") }
                if let firstResult = results.first {
                    self.navigationItem.title = firstResult.identifier
                }
            }
            let handler = VNImageRequestHandler(ciImage: image)
            try handler.perform([request])
        } catch {
            print("There was an error instantiating the ML model: \(error)")
        }

    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = selectedImage
            
            guard let ciImage = CIImage(image: selectedImage) else { fatalError("Could not convert UI Image to CI Image") }
            detect(image: ciImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
