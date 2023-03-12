//
//  UserSearchResultController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/12/23.
//

import UIKit
import Contacts
protocol UserSearchResultDelegate {
    func didSelectUser(user: User)
}
class UserSearchResultController: UITableViewController, UISearchResultsUpdating {
    var delegate : UserSearchResultDelegate?
    var users = [User]()
    var filteredUser = [User]()
    var invitedUsers = [User]()
    var contacts = [CNContact]()
    var filteredContacts = [CNContact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        users.append(User(name: "Ethan"))
        users.append(User(name: "Kirk"))
        users.append(User(name: "Ariana"))
        users.append(User(name: "Rob"))
        
        DispatchQueue.global().async {
            do {
                let keys : [Any] = [CNContactFormatter.descriptorForRequiredKeys(for: .phoneticFullName),
                            CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])

            let contactStore = CNContactStore()
        
                try contactStore.enumerateContacts(with: request) {
                    (contact, stop) in
                    // Array containing all unified contacts from everywhere
                    self.contacts.append(contact)
                }
            }
            catch(let error) {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Results"
        }
        if section == 1 {
            return "Not on Golf Level"
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return filteredUser.count
        } else {
            return filteredContacts.count
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        filteredUser = users.filter { user in
            return user.name.contains(searchText)
        }
        filteredContacts = contacts.filter { user in
            return user.givenName.contains(searchText) || user.phoneNumbers.first?.value.stringValue.contains(searchText) ?? false
        }
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
            
        }
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else {
            fatalError()
        }
        
        if indexPath.section == 0 {
            var user = filteredUser[indexPath.row]
            cell.nameLabel.text = user.name
            cell.rightButton.setTitle("Add", for: .normal)
            cell.lowerDetailLabel.isHidden = true
            cell.buttonPress = { button in
                self.invitedUsers.append(user)
                button.setTitle("Remove", for: .normal)
                cell.lowerDetailLabel.text = "Invitation sent!"
                self.addUser(user: user)
            }
            
        } else {
            var contact = filteredContacts[indexPath.row]
            cell.nameLabel.text = contact.givenName
            cell.lowerDetailLabel.text = contact.phoneNumbers.first?.value.stringValue ?? ""
            cell.rightButton.setTitle("Invite", for: .normal)
            cell.lowerDetailLabel.isHidden = false
            cell.buttonPress = { _ in
                self.showSMS(contact: contact)
            }
        }
        return cell

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        }
       else if indexPath.section == 1 {
           var contact = filteredContacts[indexPath.row]
          showSMS(contact: contact)
        }
    }
    func addUser(user:User) {
        delegate?.didSelectUser(user: user)
    }
    func showSMS(contact: CNContact) {
        var phoneNumber = contact.phoneNumbers.first?.value.stringValue
        phoneNumber?.removeAll(where: { c in
            return c == " " || c == "(" || c == ")" || c == "-"
        })
        let sms = "sms:\(String(describing: phoneNumber))&body=I would like to invite you to my match. Sign up with Golf Levels to get started."
         let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
         UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
    }
    

    
}
