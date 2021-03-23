//
//  Imgurs.swift
//  ImgurApp
//
//  Created by Ferran Hendriks on 22/03/2021.
//

import Foundation

class Imgurs: NSObject, Codable{
    var usedImgurs: String
    var imgurDate: String
    
    init(usedImgurs: String, imgurDate: String){
        self.usedImgurs = usedImgurs
        self.imgurDate = imgurDate
    }
}
