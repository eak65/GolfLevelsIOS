//
//  StartController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 4/1/23.
//

import UIKit

class StartController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var teams = [Team]()
    var startButtonPressed : (([Team])->())?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams[section].members.count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserHandicapCell") as? UserHandicapCell else {
            fatalError()
        }
        let team = teams[indexPath.section]
        let member = team.members[indexPath.row]
        cell.nameLabel.text = member.name
        cell.handicapLabel.text = member.handicap
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 30))
        var label = UILabel(frame: CGRect(x: 16, y: 10, width: 200, height: 20))
        label.text = "Team \(section + 1)";
        label.textAlignment = .left
        var handicapLabel = UILabel(frame: CGRect(x: tableView.bounds.width-110, y: 10, width: 50, height: 20))
        handicapLabel.textAlignment = .right
        handicapLabel.text = "(7.0)";
        header.addSubview(label)
        header.addSubview(handicapLabel)
        return header
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        startButtonPressed?(teams)
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
