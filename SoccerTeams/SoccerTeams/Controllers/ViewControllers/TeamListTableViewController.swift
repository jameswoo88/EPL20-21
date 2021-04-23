//
//  TeamListTableViewController.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import UIKit

class TeamListTableViewController: UITableViewController {
    
    //MARK: - Properties
    //identifiers
    let tableViewCellIdentifier = "teamTableCell"
    let teamCellIdentifier = "teamCell"
    let tableViewHeaderNibName = "TeamTableViewHeaderView"
    let tableViewHeaderIdentifier = "LaLigaCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerNib = UINib(nibName: tableViewHeaderNibName, bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: tableViewHeaderIdentifier)
        print("headerNib registered")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return LeagueController.sharedInstance.leagues.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewcell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath)
        
        return tableViewcell
    }
    
    //MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewHeaderIdentifier) as? TeamTableViewHeaderView else { return UIView() }
        let league = LeagueController.sharedInstance.leagues[section]
        headerView.leagueImageView.image = UIImage(named: league.leagueImage)
        headerView.leagueNameLabel.text = league.leagueName
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 3
    }
    

}//End of class

extension TeamListTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return LeagueController.sharedInstance.leagues.count
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LeagueController.sharedInstance.leagues[section].teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        guard let eplCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: teamCellIdentifier, for: indexPath) as? TeamCollectionViewCell else { return UICollectionViewCell() }
                
        let league = LeagueController.sharedInstance.leagues[indexPath.section]
        let team = league.teams[indexPath.row]
        
        
        eplCollectionViewCell.teamImageView.image = UIImage(named: team.teamImage)
        eplCollectionViewCell.teamNameLabel.text = team.teamName

        //JWC update later
        let image = UIImage(named: "complete")
        eplCollectionViewCell.selectButton.setImage(image, for: .normal)

        print("\(indexPath.section), \(indexPath.row)")
       
        return eplCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        self.performSegue(withIdentifier: "toDetailViewController", sender: cell)
        print("section: \(indexPath.section), row:\(indexPath.row), item: \(indexPath.item)")
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toTeamDetailVC" {
            guard let desinationVC = segue.destination as? TeamDetailViewController,
                  let cell = sender as? TeamCollectionViewCell else { return }
            //let indexPath = self.collectionView.indexPathForCell(cell)
        }
    }

}//End of extension

extension TeamListTableViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        let height = view.frame.height / 3.5
        
        return CGSize(width: width, height: height)
    }
}//End of extension
