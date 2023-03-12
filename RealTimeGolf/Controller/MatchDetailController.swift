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
class MatchDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUser))
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
