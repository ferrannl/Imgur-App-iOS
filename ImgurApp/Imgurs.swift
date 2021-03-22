//
//  Imgurs.swift
//  ImgurApp
//
//  Created by Ferran Hendriks on 22/03/2021.
//

import Foundation

class Imgurs: NSObject, Codable{
    var usedImgurs: String
    var datetime: String
    
    init(usedImgurs: String, datetime: String){
        self.usedImgurs = usedImgurs
        self.datetime = datetime
    }
}
