//
//  GamesTableViewController.swift
//  Sports Table View App
//
//  Created by Bouna Anour NDIAYE on 2020-02-28.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//

import UIKit
class GamesTableViewController: UITableViewController {
    
    var gamesContro: [game]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesContro?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if gamesContro == nil {
            return UITableViewCell()
        }
        
        let game = gamesContro![indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "Games") as? GamesTableViewCell else {return UITableViewCell() }
        
                if game.game_state == "Final" {
                    cell.homeScoreLabel.text = "\(game.home_team_score ?? 0)"
                    cell.AwayScoreLabel.text = "\(game.visit_team_score ?? 0)"
                    cell.timeLabel.isHidden = true
                } else {
                    cell.timeLabel.text = DateConverter.dateConversion(using: game.game_time!)
                    cell.homeScoreLabel.isHidden = true
                    cell.AwayScoreLabel.isHidden = true
                    cell.timeLabel.isHidden = false
                }
            cell.setHomeOutlet(image: game.home_team_logo!, name: game.home_team_name!, homeCity: game.home_team_city!, score: game.home_team_score!)
            cell.setAwayOutlet(awayName: game.visit_team_name!, awayScore: game.visit_team_score!, awayCity: game.visit_team_city!, awayImage: game.visit_team_logo!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

