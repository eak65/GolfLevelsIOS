//
//  MatchDetailController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/12/23.
//

import UIKit
struct User {
    let name : String
}
class MatchDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource, UserSearchResultDelegate {
    func didSelectUser(user: User) {
        invitedUsers.append(user)
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    var searchController : UISearchController!
    var confirmedUsers = [User]()
    var invitedUsers = [User]()

    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       var resultController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserSearchResultController") as! UserSearchResultController
        searchController = UISearchController(searchResultsController: resultController)
        resultController.delegate = self
        searchController.searchResultsUpdater = resultController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"

        definesPresentationContext = true
        
        self.navigationItem.searchController = searchController
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        

    }

    @objc func addUser() {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else {
            fatalError()
        }
        var currentUser : User?
        if indexPath.section == 0 {
           currentUser = confirmedUsers[indexPath.row]
        } else {
            currentUser = invitedUsers[indexPath.row]
        }
        cell.nameLabel.text = currentUser?.name ?? ""
        cell.buttonPress = {[section = indexPath.section, weak tableView] _ in
            if section == 0 {
                self.confirmedUsers.remove(at: indexPath.row)
            } else {
                self.invitedUsers.remove(at: indexPath.row)

            }
            DispatchQueue.main.async {
                tableView?.reloadData()
            }
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Confirmed"
        } else if section == 1 {
            return "Invited"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return confirmedUsers.count
        } else if section == 1 {
            return invitedUsers.count
        }
        return 0
    }
    
    @IBAction func formTeamsButtonPressed(_ sender: Any) {
       var teamsController = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(identifier: "CreateTeamsController")
        self.navigationController?.pushViewController(teamsController, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
