//
//  TeamListTableViewController.swift
//  SoccerTeams
//
//  Created by James Chun on 4/22/21.
//

import UIKit

class TeamListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    //MARK: - Properties
    //identifiers
    let tableViewHeaderNibName = "TeamTableViewHeaderView"
    let tableViewCellNibName = "TeamTableViewCell"
    let tableViewHeaderIdentifier = "teamTableViewHeader"
    let tableViewCellIdentifier = "teamTableViewCell"
    let segueToDetailVCIdentifer = "toTeamDetailVC"
    
    // Optional tapped cell to be assigend before segue
    var tappedCell: Team?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {

        super.viewDidLoad()
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none

        favoriteSwitch.isOn = false

        // Register the xib for tableview header
        let headerNib = UINib(nibName: tableViewHeaderNibName, bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: tableViewHeaderIdentifier)
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: tableViewCellNibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: tableViewCellIdentifier)
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - Actions
    @IBAction func favotieSwithToggled(_ sender: UISwitch) {
        LeagueController.sharedInstance.update(forState: sender.isOn)
        tableView.reloadData()
    }
        
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return LeagueController.sharedInstance.leagues.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as? TeamTableViewCell else { return UITableViewCell() }
        let section = indexPath.section
        let league = LeagueController.sharedInstance.leagues[section]
        let teamArray = league.teams
        
        cell.updateCellWith(arrayOfTeams: teamArray)
        cell.tableViewSectionIndex = section
        cell.delegate = self
        
        return cell
    }
        
    //MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewHeaderIdentifier) as? TeamTableViewHeaderView else { return UIView() }
        let league = LeagueController.sharedInstance.leagues[section]
        headerView.leagueImageView.image = UIImage(named: league.leagueImage)
        headerView.leagueNameLabel.text = league.leagueName
        
        headerView.stackView.layer.borderWidth = 2
        headerView.stackView.layer.borderColor = UIColor.gray.cgColor
        headerView.stackView.layer.cornerRadius = 5
        
        return headerView
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toTeamDetailVC" {
            guard let destinationVC = segue.destination as? TeamDetailViewController,
                  let tappedCell = tappedCell else { return }
            
            destinationVC.league = LeagueController.sharedInstance.leagues[tappedCell.leagueNum]
            destinationVC.team = tappedCell
        }
    }
    
}//End of class

extension TeamListTableViewController: CollectionViewCellDelegate {
    func collectionView(collectionViewCell: TeamCollectionViewCell?, index: Int, tableViewCell: TeamTableViewCell) {
        if let teams = tableViewCell.teams {
            self.tappedCell = teams[index]
            performSegue(withIdentifier: segueToDetailVCIdentifer, sender: self)
        }
    }
    
}//End of extension
