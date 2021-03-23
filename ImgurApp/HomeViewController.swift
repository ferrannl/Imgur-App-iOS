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
        // set custom cell for table view
        let nib = UINib(nibName: "ImgurTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ImgurTableViewCell")
        tableView.rowHeight = 44
        tableView.delegate = self
        tableView.dataSource = self
        
        // decode objects in localstorage
        let defaults = UserDefaults.standard
        if let savedImages = defaults.object(forKey: "images") as? Data{
            let jsonDecoder = JSONDecoder()
            do {
                images = try jsonDecoder.decode([Imgurs].self, from: savedImages)
            } catch{
                //print("No images or failed to load images")
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("text"), object: nil)
        
    }
    
    @objc func didGetNotification(_ notification: Notification){
        let data = notification.object as! [String?]
        let imgur = Imgurs(usedImgurs: data[0]!, imgurDate: data[1]!)
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
        let urlString = self.images[indexPath.row].usedImgurs
        if let url = URL(string: urlString){
            UIApplication.shared.open(url)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.images.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.save()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImgurTableViewCell", for: indexPath) as! ImgurTableViewCell
        
        //date for cell
        let tempDate = images[indexPath.row].imgurDate
        cell.myDateLabel.text = tempDate
        //url for cell
        let tempText = images[indexPath.row].usedImgurs
        let urlString = (tempText as NSString).deletingPathExtension
        cell.myLabel.text = urlString
        
        return cell
    }
}
