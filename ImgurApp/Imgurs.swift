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
    var imgurType: String
    
    init(usedImgurs: String, imgurType: String, imgurDate: String){
        self.usedImgurs = usedImgurs
        self.imgurType = imgurType
        self.imgurDate = imgurDate
    }
}
