//
//  TeamTableViewCell.swift
//  SoccerTeams
//
//  Created by James Chun on 4/24/21.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    // delegate method to perform a segue into TeamDetailViewController
    func collectionView(collectionViewCell: TeamCollectionViewCell?, index: Int, tableViewCell: TeamTableViewCell)
}

class TeamTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    //identifiers
    let collectionViewCellNibName = "TeamCollectionViewCell"
    let collectionViewCellIdentifier = "teamCollectionViewCell"
    
    var teams: [Team]?
    var tableViewSectionIndex: Int?
    
    weak var delegate: CollectionViewCellDelegate?
    
    //MARK: - Outlets
    @IBOutlet weak var teamCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white
        
        // Set up collection view flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 170, height: 220)
        flowLayout.minimumLineSpacing = 8.0
        teamCollectionView.collectionViewLayout = flowLayout
        teamCollectionView.showsHorizontalScrollIndicator = true
        
        // Assign collection view delegate and data source as self
        teamCollectionView.delegate = self
        teamCollectionView.dataSource = self
        
        // Register a xib for collection view cell
        let cellNib = UINib(nibName: collectionViewCellNibName, bundle: nil)
        teamCollectionView.register(cellNib, forCellWithReuseIdentifier: collectionViewCellIdentifier)
    }
    
}//End of class

//Extensions
extension TeamTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Use the data from the TableView and passed them to the teams array
    func updateCellWith(arrayOfTeams: [Team]) {
        self.teams = arrayOfTeams
        teamCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let teams = teams else { return 0 }
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as? TeamCollectionViewCell,
              let teams = teams,
              let section = tableViewSectionIndex else { return UICollectionViewCell() }
                
        let team = teams[indexPath.row]
        team.leagueNum = section
        
        cell.delegate = self
        
        cell.teamImageView.image = UIImage(named: team.teamImage)
        cell.teamNameLabel.text = team.teamName
        
        let checkedBox = UIImage(named: "complete")
        let uncheckedBox = UIImage(named: "incomplete")
        if team.isFavorite {
            cell.favoriteTeamButton.setImage(checkedBox, for: .normal)
        } else {
            cell.favoriteTeamButton.setImage(uncheckedBox, for: .normal)
        }
        
        //Configuration
        cell.teamNameLabel.numberOfLines = 0
               
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? TeamCollectionViewCell else { return }
        
        delegate?.collectionView(collectionViewCell: cell, index: indexPath.item, tableViewCell: self)
    }
    

}//End of extension

extension TeamTableViewCell: FavoriteTeamButtonDelegate {
    func teamCollectionViewCellTapped(for sender: TeamCollectionViewCell) {
        guard let indexPath = teamCollectionView.indexPath(for: sender),
              let section = tableViewSectionIndex else { return }
        
        sender.team = LeagueController.sharedInstance.leagues[section].teams[indexPath.row]
        if let team = sender.team {
            LeagueController.sharedInstance.toggleIsComplete(team: team)
        }
        
        sender.updateViews()
    }
    
}//End of extension
