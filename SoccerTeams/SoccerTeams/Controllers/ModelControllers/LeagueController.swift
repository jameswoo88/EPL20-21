//
//  LeagueController.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import UIKit

class LeagueController {
    //MARK: - Shared Instance
    static let sharedInstance = LeagueController()
    
    //MARK: - SOT
    var leagues: [League] = {
        let epl = League(leagueName: "English Premier League", leagueImage: "epl", teams: TeamController.eplTeams)
        let laLiga = League(leagueName: "Spanish Primera Liga", leagueImage: "la liga", teams: TeamController.laLigaTeams)
        
        return [epl, laLiga]
    }()
    

}//End of class
