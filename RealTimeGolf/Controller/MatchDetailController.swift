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
        users.append(user)
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    var searchController : UISearchController!
    var users = [User]()
    var filteredUsers = [User]()

    
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
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        users.append(User(name: "Ethan"))
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUser))
        
        // 1
        searchController.searchResultsUpdater = resultController
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search"
        
        // 4
        // 5
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
        cell.nameLabel.text = users[indexPath.row].name
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
        return users.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
