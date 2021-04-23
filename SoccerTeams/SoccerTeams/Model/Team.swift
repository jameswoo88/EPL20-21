//
//  Team.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import Foundation

class Team {
    let teamName: String
    let teamImage: String
    let city: String
    let staduim: String
    let isFavorite: Bool
    let uuid: String

    
    init(teamName: String, teamImage: String, city: String, stadium: String, isFavorite: Bool = false, uuid: String = UUID().uuidString) {
        self.teamName = teamName
        self.teamImage = teamImage
        self.city = city
        self.staduim = stadium
        self.isFavorite = isFavorite
        self.uuid = uuid
    }
} //End of class

extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.uuid == rhs.uuid
    }

} //End of extension
