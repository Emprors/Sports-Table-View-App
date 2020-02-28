//
//  SportsTableController.swift
//  Sports Table View App
//
//  Created by Bouna Anour NDIAYE on 2020-02-27.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//

import UIKit

class SportsTableViewController: UITableViewController {
    var leagues : [league]?
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
                print(jsonData)
            } catch {
                print(error)
            }
        }
    }
}
