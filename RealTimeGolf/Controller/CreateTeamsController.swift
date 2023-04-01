//
//  CreateTeamsController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/12/23.
//

import UIKit

class CreateTeamsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var teamCountStepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var teamCountLabel: UILabel!
    var numberOfTeams : Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teamCountStepper.addTarget(self, action: #selector(valueChange), for:  .valueChanged)
        self.teamCountStepper.maximumValue = 100
        self.teamCountStepper.value = 1.0
        self.teamCountLabel.text = "\(numberOfTeams)"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView?.translatesAutoresizingMaskIntoConstraints = false


        // Do any additional setup after loading the view.
    }
    @objc func valueChange(stepper: Any) {
        guard let stepper = stepper as? UIStepper else {
            fatalError()
        }
        numberOfTeams = Int(stepper.value)
        self.teamCountLabel.text = "\(numberOfTeams)"
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell") as? TextFieldCell else {
            fatalError()
        }
        cell.textField.placeholder = "Team Name \(indexPath.row + 1)"
        cell.textField.delegate = self
        return cell
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(false)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfTeams
    }
    @IBAction func manualAssignPressed(_ sender: Any) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ManuallyAssignController") as? AssignController else {
            fatalError()
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func blindDrawPressed(_ sender: Any) {
        
    }
    
}
