//
//  DetailViewController.swift
//  ImgurApp
//
//  Created by Ferran Hendriks on 22/03/2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imgurURLTextView: UITextView!
        
    var imgurUrl: String = ""
    var imgurDate: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgurURLTextView.text = imgurUrl
    }
    
    @IBAction func didTapSave(){
        NotificationCenter.default.post(name: Notification.Name("text"), object: [imgurUrl, imgurDate])

        dismiss(animated: true, completion: nil)
    }
    
}
