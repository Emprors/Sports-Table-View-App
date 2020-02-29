//
//  SportsTableViewCell.swift
//  Sports Table View App
//
//  Created by Bouna Anour NDIAYE on 2020-02-27.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//

import UIKit

class SportsTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    @IBOutlet weak var sportNameLabel: UILabel!
    
    
    
    func setCell (image: String, sportName: String){
        ImageViewOutlet.image = UIImage(named: image)
        sportNameLabel.text = sportName
    }
}
