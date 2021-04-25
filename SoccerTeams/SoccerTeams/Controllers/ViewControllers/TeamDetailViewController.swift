//
//  TeamDetailViewController.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var leagueStackView: UIStackView!
    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var favoriteTeamButton: UIButton!
    @IBOutlet weak var teamCityLabel: UILabel!
    @IBOutlet weak var teamStadiumLabel: UILabel!
    
    //MARK: - Properties
    var league: League?
    var team: Team?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Actions
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let team = team else { return }
        LeagueController.sharedInstance.toggleIsComplete(team: team)
        updateViews()
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let league = league,
              let team = team else { return }
        leagueImageView.image = UIImage(named: league.leagueImage)
        leagueNameLabel.text = league.leagueName
        teamImageView.image = UIImage(named: team.teamImage)
        teamNameLabel.text = team.teamName
        teamCityLabel.text = "City: \(team.city)"
        teamStadiumLabel.text = "Stadium: \(team.staduim)"
        if team.isFavorite {
            favoriteTeamButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            favoriteTeamButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
        
        //Configuration
        leagueStackView.layer.borderWidth = 2
        leagueStackView.layer.borderColor = UIColor.brown.cgColor
        leagueStackView.layer.cornerRadius = 10
        teamImageView.layer.cornerRadius = 15
        teamNameLabel.layer.borderWidth = 2
        teamNameLabel.layer.borderColor = UIColor.brown.cgColor
        teamNameLabel.layer.cornerRadius = 10
    }

} //End of class
