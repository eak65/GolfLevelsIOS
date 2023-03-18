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
}
class MatchTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateDelegate {

    var matches = [Match]()
    
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
        var storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let  createController = storyBoard.instantiateViewController(withIdentifier: "CreateController") as? CreateController else {
            fatalError()
        }
       createController.delegate = self
        if let sheet = createController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.navigationController?.present(createController, animated: true)
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
        matches.append(Match(name: name, date: date))
        tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var matchDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MatchDetailController")
        self.navigationController?.pushViewController(matchDetailViewController, animated: true)
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
