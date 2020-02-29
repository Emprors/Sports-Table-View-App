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
    var currIndex: Int?
    
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
    
    func loadData(fileName: String) {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: ".json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(leagueData.self, from: data)
                
                leagues = jsonData.leagues
            } catch
                let DecodingError.keyNotFound(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    
            } catch{
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? GamesTableViewController {
            if let cell = sender as? UITableViewCell{
                let index = tableView.indexPath(for: cell)
                currIndex = index?.row
                if let ArrayLeagues = leagues?[currIndex!], ArrayLeagues.name == "Hockey" {
                    destinationVC.gamesContro = ArrayLeagues.games
                    
                } else if let ArrayLeagues = leagues?[currIndex!], ArrayLeagues.name == "Basketball" {
                    destinationVC.gamesContro = ArrayLeagues.games
                } else if let ArrayLeagues = leagues?[currIndex!], ArrayLeagues.name == "Baseball" {
                    destinationVC.gamesContro = ArrayLeagues.games
                }
            }
            
        }
    }
}
