//
//  ActiveController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 4/1/23.
//

import UIKit

struct Hole {
    let number: Int
    let score : [UserScore]
}

struct UserScore {
    let user: User
    let score: Int
}

class ActiveController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var potLabel: UILabel!
    @IBOutlet weak var holeLabel: UILabel!
    var teams = [Team]()
    var nextButtonPressed : ((Hole)->())?
    var hole : Hole?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        guard let hole = hole else {
            fatalError()
        }
        nextButton.setTitle("Next Hole", for: .normal)
        holeLabel.text = "Hole \(hole.number)"
        
        // Do any additional setup after loading the view.
    }
    
  @objc func close() {
        self.dismiss(animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserHoleCell") as? UserHoleCell else {
            fatalError()
        }
        let team = teams[indexPath.section]
        let member = team.members[indexPath.row]
        cell.nameLabel.text = member.name
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams[section].members.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return teams.count
    }

    @IBAction func nextButton(_ sender: Any) {
        guard let hole = hole else {
            return
        }
        nextButtonPressed?(hole)
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
