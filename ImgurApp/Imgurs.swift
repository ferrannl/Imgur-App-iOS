//
//  Imgurs.swift
//  ImgurApp
//
//  Created by Ferran Hendriks on 22/03/2021.
//

import Foundation

class Imgurs: NSObject, Codable{
    var usedImgurs: String
    init(usedImgurs: String){
        self.usedImgurs = usedImgurs
    }
}
