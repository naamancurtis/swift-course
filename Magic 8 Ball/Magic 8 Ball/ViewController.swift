//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Naaman Curtis on 01/06/2019.
//  Copyright © 2019 Naaman Curtis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ballArray: [String] = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    @IBOutlet weak var imageView: UIImageView!
    var randomBallNumber: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateBallImage()
    }
    
    @IBAction func askButtonPressed(_ sender: Any) {
        generateBallImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        generateBallImage()
    }
    
    func generateBallImage(){
        randomBallNumber = Int.random(in: 0...4)
        imageView.image = UIImage(named: ballArray[randomBallNumber])
    }

}

