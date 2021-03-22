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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgurURLTextView.text = imgurUrl
    }
}
