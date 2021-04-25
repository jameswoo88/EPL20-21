//
//  League.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import Foundation

class League: Codable {
    let leagueName: String
    let leagueImage: String
    let teams: [Team]
    let uuid: String
    
    init(leagueName: String, leagueImage: String, teams: [Team], uuid: String = UUID().uuidString) {
        self.leagueName = leagueName
        self.leagueImage = leagueImage
        self.teams = teams
        self.uuid = uuid
    }
} //End of class

extension League: Equatable {
    static func == (lhs: League, rhs: League) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
}
