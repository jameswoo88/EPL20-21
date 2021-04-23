//
//  TeamController.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import UIKit

class TeamController {
    static var eplTeams: [Team] = {
        let arsenal = Team(teamName: "Arsenal", teamImage: "arsenal", city: "London", stadium: "Emirates Stadium")
        let astonVilla = Team(teamName: "Aston Villa", teamImage: "aston villa", city: "Birmingham", stadium: "Villa Park")
        let brightonHovAlbion = Team(teamName: "Brighton & Hove Albion", teamImage: "brighton hove albion", city: "Brighton", stadium: "Amex Stadium")
        let burnley = Team(teamName: "Burnley", teamImage: "burnley", city: "Burnley", stadium: "Turf Moor")
        let chelsea = Team(teamName: "Chelsea", teamImage: "chelsea", city: "London", stadium: "Stamford Bridge")
        let crystalPalace = Team(teamName: "Crystal Palace", teamImage: "crystal palace", city: "London", stadium: "Selhurst Park")
        let everton = Team(teamName: "Everton", teamImage: "everton", city: "Liverpool", stadium: "Goodison Park")
        let fullham = Team(teamName: "Fullham", teamImage: "fullham", city: "London", stadium: "Craven Cottage")
        let leedsUtd = Team(teamName: "Leeds United", teamImage: "leeds united", city: "Leeds", stadium: "Elland Road")
        let leicester = Team(teamName: "Leicester City", teamImage: "leicester city", city: "Leicester", stadium: "King Power Stadium")
        let liverpool = Team(teamName: "Liverpool", teamImage: "liverpool", city: "Liverpool", stadium: "Anfield")
        let manCity = Team(teamName: "Manchester City", teamImage: "manchester city", city: "Manchester", stadium: "Etihad Stadium")
        let manUtd = Team(teamName: "Manchester United", teamImage: "manchester united", city: "Manchester", stadium: "Old Trafford")
        let newcastleUtd = Team(teamName: "Newcastle United", teamImage: "newcastle united", city: "Newcastle", stadium: "St. James' Park")
        let sheffiledUtd = Team(teamName: "Sheffield United", teamImage: "sheffield united", city: "Sheffield", stadium: "bramall Lane")
        let southampton = Team(teamName: "Southampton", teamImage: "south hampton", city: "Southampton", stadium: "St. Mary's Stadium")
        let tottenham = Team(teamName: "Tottenham Hotspur", teamImage: "tottenham hotspur", city: "London", stadium: "Tottenham Hotspur Stadium")
        let westBrom = Team(teamName: "West Bromwich Albion", teamImage: "west bromwich albion", city: "West Bromwich", stadium: "The Hawthorns")
        let westHam = Team(teamName: "West Ham United", teamImage: "west ham united", city: "west ham united", stadium: "London Stadium")
        let wolverhampton = Team(teamName: "Wolverhampton Wanderers", teamImage: "wolverhampton wanderers", city: "Wolverhampton", stadium: "Molineux Stadium")
        
        
        return[arsenal, astonVilla, brightonHovAlbion, burnley, chelsea, crystalPalace, everton, fullham, leedsUtd, leicester, liverpool, manCity, manUtd, newcastleUtd, sheffiledUtd, southampton, tottenham, westBrom, westHam, wolverhampton]
    }()
    
    static var laLigaTeams: [Team] = {
        let alaves = Team(teamName: "Alavés", teamImage: "alaves", city: "Vitoria-Gasteiz", stadium: "Mendizorrotza")
        let athletic = Team(teamName: "Athletic Club", teamImage: "athletic", city: "Bilbao", stadium: "San Mamés")
        let atletico = Team(teamName: "San Mamés", teamImage: "atletico", city: "Madrid", stadium: "Wanda Metropolitano")
        let barcelona = Team(teamName: "Barcelona", teamImage: "barcelona", city: "Barcelona", stadium: "Camp Nou")
        let betis = Team(teamName: "Real Betis", teamImage: "betis", city: "Seville", stadium: "Benito Villamarín")
        let cadiz = Team(teamName: "Cádiz", teamImage: "cadiz", city: "Cádiz", stadium: "Ramón de Carranza")
        let celta = Team(teamName: "Celta Vigo", teamImage: "celta", city: "Vigo", stadium: "Abanca-Balaídos")
        let eibar = Team(teamName: "Eibar", teamImage: "eibar", city: "Eibar", stadium: "Ipurua")
        let elche = Team(teamName: "Elche", teamImage: "elche", city: "Elche", stadium: "Martínez Valero")
        let getafe = Team(teamName: "Getafe", teamImage: "getafe", city: "Getafe", stadium: "Coliseum Alfonso Pérez")
        let granada = Team(teamName: "Granada", teamImage: "granada", city: "Granada", stadium: "Nuevo Los Cármenes")
        let huesca = Team(teamName: "Huesca", teamImage: "huesca", city: "Huesca", stadium: "El Alcoraz")
        let levante = Team(teamName: "Levante", teamImage: "levante", city: "Valencia", stadium: "Ciutat de València")
        let osasuna = Team(teamName: "Osasuna", teamImage: "osasuna", city: "Pamplona", stadium: "El Sadar")
        let realMadrid = Team(teamName: "Real Madrid", teamImage: "real madrid", city: "Madrid", stadium: "Santiago Bernabéu")
        let realSociedad = Team(teamName: "Real Sociedad", teamImage: "real sociedad", city: "San Sebastián", stadium: "Anoeta")
        let realValladolid = Team(teamName: "Real Valladolid", teamImage: "real valladolid", city: "Valladolid", stadium: "José Zorrilla")
        let sevilla = Team(teamName: "Sevilla", teamImage: "sevilla", city: "Seville", stadium: "Ramón Sánchez Pizjuán")
        let valencia = Team(teamName: "Valencia", teamImage: "valencia", city: "Valencia", stadium: "Mestalla")
        let villarreal = Team(teamName: "Villarreal", teamImage: "villarreal", city: "Villarreal", stadium: "Estadio de la Cerámica")
        
        return [alaves, athletic, atletico, barcelona, betis, cadiz, celta, eibar, elche, getafe, granada, huesca, levante, osasuna, realMadrid, realSociedad, realValladolid, sevilla, valencia, villarreal]
    }()
}//End of class
