//
//  SportsTableController.swift
//  Sports Table View App
//
//  Created by Bouna Anour NDIAYE on 2020-02-27.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//

import UIKit


class SportsTableViewController: UITableViewController{
    
    
    var leagues : [league]?
    var currentIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return leagues?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if leagues == nil {
            return UITableViewCell()
        }
        
        let indexLeague = leagues![indexPath.row]
        print(indexLeague.name)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Sport") as! SportsTableViewCell
        cell.setCell(image: indexLeague.image, sportName: indexLeague.name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//******** Method using to load data drom json file  *************
    func loadData(fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: ".json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(leagueData.self, from: data)
                leagues = jsonData.leagues
            } catch{
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? GamesTableViewController {
            if let cell = sender as? UITableViewCell{
                let index = tableView.indexPath(for: cell)
                currentIndex = index?.row
                if let ArrayLeagues = leagues?[currentIndex!], ArrayLeagues.name == "Hockey" {
                    destinationVC.gamesObject = ArrayLeagues.games
                } else if let ArrayLeagues = leagues?[currentIndex!], ArrayLeagues.name == "Basketball" {
                    destinationVC.gamesObject = ArrayLeagues.games
                } else if let ArrayLeagues = leagues?[currentIndex!], ArrayLeagues.name == "Baseball" {
                    destinationVC.gamesObject = ArrayLeagues.games
                }
            }
            
        }
    }
}
