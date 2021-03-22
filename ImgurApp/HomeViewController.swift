//
//  HomeViewController.swift
//  ImgurApp
//
//  Created by Ferran Hendriks on 21/03/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var images = [Imgurs]()
    
    let userDefaults = UserDefaults()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let defaults = UserDefaults.standard
        if let savedImages = defaults.object(forKey: "images") as? Data{
            let jsonDecoder = JSONDecoder()
            do {
                images = try jsonDecoder.decode([Imgurs].self, from: savedImages)
            } catch{
                print("Failed to load words")
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("text"), object: nil)
        
    }
    
    @objc func didGetNotification(_ notification: Notification){
        let text = notification.object as! String?
        let imgur = Imgurs(usedImgurs: text!)
        images.append(imgur)
        self.save()
        tableView.reloadData()
        
    }
    
    func save(){
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(images){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "images")
        } else{
            print("Failed to save image data")
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = images[indexPath.row].usedImgurs
        
    return cell
    }
        

}
