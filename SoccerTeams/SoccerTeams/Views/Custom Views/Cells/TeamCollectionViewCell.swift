//
//  TeamCollectionViewCell.swift
//  SoccerTeams
//
//  Created by James Chun on 4/24/21.
//

import UIKit

protocol FavoriteTeamButtonDelegate: class {
    func teamCollectionViewCellTapped(for sender: TeamCollectionViewCell)
}

class TeamCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var favoriteTeamButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: FavoriteTeamButtonDelegate?
    
    var team: Team? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - Actions
    @IBAction func favoriteTeamButtonTapped(_ sender: Any) {
        self.delegate?.teamCollectionViewCellTapped(for: self)
    }
    
    //MARK: - Helper Methods
    func updateViews() {
        guard let team = team else { return }
        
        if team.isFavorite {
            favoriteTeamButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            favoriteTeamButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
    
}//End of class
