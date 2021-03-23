//
//  ImgurTableViewCell.swift
//  ImgurApp
//
//  Created by Ferran Hendriks on 22/03/2021.
//

import UIKit

class ImgurTableViewCell: UITableViewCell {

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
