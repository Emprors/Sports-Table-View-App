//
//  WeekTableViewController.swift
//  Sports Table View App
//
//  Created by Bouna Anour NDIAYE on 2020-02-27.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//

import UIKit

class WeekTableViewController: UITableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? SportsTableViewController else {return}
           if segue.identifier == "WeekOneToSports" {
            destinationVC.loadData(fileName: "sports_week_1")
           } else {
            destinationVC.loadData(fileName: "sports_week_2")
            
        }
    }
    
}
