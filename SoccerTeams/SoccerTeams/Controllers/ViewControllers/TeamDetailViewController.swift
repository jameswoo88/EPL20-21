//
//  TeamDetailViewController.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamCityLabel: UILabel!
    @IBOutlet weak var teamStadiumLabel: UILabel!
    
    //MARK: - Properties
    var league: League?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Functions
    

} //End of class
