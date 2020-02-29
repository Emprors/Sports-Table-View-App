//
//  GamesTableViewCell.swift
//  Sports Table View App
//
//  Created by Bouna Anour NDIAYE on 2020-02-28.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//



import UIKit

class GamesTableViewCell: UITableViewCell {
    @IBOutlet weak var homeImageOutlet: UIImageView!
    @IBOutlet weak var homeNameLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var AwayImageOutlet: UIImageView!
    @IBOutlet weak var AwayNameLabel: UILabel!
    @IBOutlet weak var AwayScoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    func setHomeOutlet (image: String, name: String, homeCity: String, score: Int){
        homeImageOutlet.image = UIImage(named: image)
        homeNameLabel.text = "\(homeCity) \(name)"
        homeScoreLabel.text = "\(score)"
        
    }
    func setAwayOutlet (awayName: String, awayScore:Int, awayCity: String, awayImage: String){
        AwayNameLabel.text = "\(awayCity) \(awayName)"
        AwayScoreLabel.text = "\(awayScore)"
        AwayImageOutlet.image = UIImage(named: awayImage)
    }
    
    func gameState (homeScore: String, awayScore: String, game: String){
        if game == "Finale"{
            homeScoreLabel.text = "\(homeScore)"
            AwayScoreLabel.text = "\(awayScore)"
            timeLabel.isHidden = true
        } else {
            homeScoreLabel.isHidden = true
            AwayScoreLabel.isHidden = true
            print(game)
        }
    }
}
