//
//  Team.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import Foundation

class Team: Codable {
    let teamName: String
    let teamImage: String
    let city: String
    let staduim: String
    var isFavorite: Bool
    var leagueNum: Int
    let uuid: String

    
    init(teamName: String, teamImage: String, city: String, stadium: String, isFavorite: Bool = false, leagueNum: Int = 0, uuid: String = UUID().uuidString) {
        self.teamName = teamName
        self.teamImage = teamImage
        self.city = city
        self.staduim = stadium
        self.isFavorite = isFavorite
        self.uuid = uuid
        self.leagueNum = leagueNum
    }
} //End of class

extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    }

} //End of extension
