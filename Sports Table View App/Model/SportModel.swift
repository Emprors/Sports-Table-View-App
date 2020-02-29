//
//  SportModel.swift
//  Sports Table View App
//
//  Created by Bouna Anour NDIAYE on 2020-02-27.
//  Copyright © 2020 Bouna Anour NDIAYE. All rights reserved.
//

import Foundation


struct leagueData: Decodable {
    var leagues: [league]
}

struct league: Decodable {
    let name: String
    let image : String
    let games: [game]
    }

struct game: Decodable {
    let game_state: String?
    let game_time: Int?
    let home_team_city: String?
    let home_team_name: String?
    let home_team_score: Int?
    let home_team_logo: String?
    let visit_team_city: String?
    let visit_team_name: String?
    let visit_team_score: Int?
    let visit_team_logo: String?
}
