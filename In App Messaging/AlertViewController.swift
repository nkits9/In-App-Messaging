//
//  AlertViewController.swift
//  In App Messaging
//
//  Created by MOHIT SHARMA on 07/12/20.
//

import UIKit
import Firebase
import FirebaseDatabase

class AlertViewcontroller: UIViewController {
    
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var displayText: UILabel!
    
    var imageURL = String()
    var text =  String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        displayText.text = text
        fetchImage(imageURL)
}
    
    @IBAction func dismissTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func fetchData() {
        var ref : DatabaseReference!
        ref = Database.database().reference()
        
        ref?.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value as? [String : Any] else { return }
            guard let shouldDisplayAlert = value["shouldDisplayAlert"] as? Bool else { return }
            
            if shouldDisplayAlert {
                guard let alert = value["Alert"] as? [String : Any] else { return }
                print("🥕", alert, "🥕")
                
                guard let imageUrl = alert["image"] as? String else { return }
                print("🧩", imageUrl, "🧩")

                guard let text = alert["text"] as? String else { return }
                print("👊🏻", text, "👊🏻")

                self.imageURL = imageUrl
                self.text = text
                
            }
            
        })
    
        
    }
    
    
    func fetchImage(_ imageURL: String) {
        print("🥦", imageURL, "🥦")
        guard let url = URL(string: imageURL) else { return }
        let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.displayImage.image = image
                print("☕️")
            }
        }
        getDataTask.resume()
    }
    
    
    
}
