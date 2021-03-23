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
        UserDefaults.standard.removeObject(forKey: "is_app_launched")
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImgurTableViewCell", for: indexPath) as! ImgurTableViewCell
        
        //date for cell
        let tempEpochTime = String(images[indexPath.row].imgurDate)
        if(tempEpochTime != ""){
            let EpochTime = TimeInterval(tempEpochTime)
            if(EpochTime != nil){
                let date = Date(timeIntervalSince1970: EpochTime!)
                print(date)
                        cell.myDateLabel.text = fixDate(Date: date)
            } else{
                print(tempEpochTime)
            cell.myDateLabel.text = fixDate(Date: Date())
            }
        } else{
            cell.myDateLabel.text = fixDate(Date: Date())

        }
        
        //url for cell
        let tempText = images[indexPath.row].usedImgurs
        let urlString = (tempText as NSString).deletingPathExtension
        cell.myLabel.text = urlString
        

    return cell
    }
    
    func fixDate(Date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: Date)
        dateFormatter.dateFormat = "MM"
        let monthString = dateFormatter.string(from: Date)
        dateFormatter.dateFormat = "dd"
        let dayString = dateFormatter.string(from: Date)
        dateFormatter.dateFormat = "HH"
        let hourString = dateFormatter.string(from: Date)
        dateFormatter.dateFormat = "mm"
        let minuteString = dateFormatter.string(from: Date)
        
        let newDate = dayString + "-" + monthString + "-" + yearString + "- " + hourString + ":" + minuteString
        return newDate
    }
}
