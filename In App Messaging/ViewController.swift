//
//  ViewController.swift
//  In App Messaging
//
//  Created by MOHIT SHARMA on 25/11/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var coffeeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coffeeButton.layer.cornerRadius = coffeeButton.frame.height/2 - 10
        coffeeButton.clipsToBounds = true
    }

    @IBAction func buttonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = storyboard.instantiateViewController(identifier: "alert")
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.modalTransitionStyle = .crossDissolve
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

