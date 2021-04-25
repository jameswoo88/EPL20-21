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
    
    //MARK: - Helper Functions
    func update(forState isFavorite: Bool) {
        if isFavorite {
            var favoriteEplTeams = [Team]()
            var favoriteLaLigaTeams = [Team]()

            for team in TeamController.eplTeams {
                if team.isFavorite {
                    favoriteEplTeams.append(team)
                }
            }
            
            for team in TeamController.laLigaTeams {
                if team.isFavorite {
                    favoriteLaLigaTeams.append(team)
                }
            }
            
            leagues = [
                League(leagueName: "English Premier League", leagueImage: "epl", teams: favoriteEplTeams),
                League(leagueName: "Spanish Primera Liga", leagueImage: "la liga", teams: favoriteLaLigaTeams)
            ]
            
        } else {
            leagues = [
                League(leagueName: "English Premier League", leagueImage: "epl", teams: TeamController.eplTeams),
                League(leagueName: "Spanish Primera Liga", leagueImage: "la liga", teams: TeamController.laLigaTeams)
            ]
        }
        
    }
    
    func toggleIsComplete(team: Team) {
        team.isFavorite.toggle()
    }
    
}//End of class
