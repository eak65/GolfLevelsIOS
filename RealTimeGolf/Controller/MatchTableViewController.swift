//
//  MatchTableViewController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/11/23.
//

import UIKit
struct Match {
    let name : String
    let date : Date
    let confirmed: [User]
}
class MatchTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MatchLoadableSuccessView {
    var matches = [Match]()
    var addMatchButton : (() -> ())?
    var didSelectMatch: ((Match)->())?
    
    func showSuccess(object: Match) {
        self.matches.append(object)
        self.tableView.reloadData()
    }
    
    func isLoading(showLoadingIndicator: Bool) {
        
    }
    
    func showError() {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMatch))
      //  self.tableView.register
        // Do any additional setup after loading the view.
    }
   @objc func addMatch(){
       self.addMatchButton?()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as? MatchCell
        let match = matches[indexPath.row]
        cell?.matchNameLabel.text = match.name
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy hh:mm a"
        cell?.dateLabel.text = formatter.string(from: match.date)
        cell?.selectionStyle = .none
        return cell!
    }
    func didCreate(name: String, date: Date) {
        matches.append(Match(name: name, date: date, confirmed: [User]()))
        tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectMatch?(matches[indexPath.row])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
