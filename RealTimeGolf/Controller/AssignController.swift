//
//  ManuallyAssignController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/12/23.
//

import UIKit


protocol AssignControllerOutput {
    func manuallyAssign(users: [User])
    func blindDraw(users: [User])
}

class AssignController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var users = [User]()
    var nextButton : (()->())?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        users.append(User(name: "Kirk", handicap: "3.2"))
        users.append(User(name: "Ethan",handicap: "3.2"))
        users.append(User(name: "Ariana", handicap: "3.2"))
        users.append(User(name: "Rob", handicap: "3.2"))

        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        nextButton?()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamSelectCell") as? TeamSelectCell else {
            fatalError()
        }
        let user = users[indexPath.row]
        cell.teamNameLabel.text = user.name
        let optionClosure = {(action: UIAction) in
                 print(action.title)
             }
        
        
        // create an array to store the actions
        var optionsArray = [UIAction]()

        // loop and populate the actions array
        for country in ["none selected","1","2"]{
            // create each action and insert the right country as a title
            let action = UIAction(title: country, state: .off, handler: optionClosure)
                    
            // add newly created action to actions array
            optionsArray.append(action)
        }
                
                
        // set the state of first country in the array as ON
        optionsArray[0].state = .on

        // create an options menu
        let optionsMenu = UIMenu(title: "", options: .displayInline, children: optionsArray)
                
        // add everything to your button
        cell.selectionPopUpButton.menu = optionsMenu

        // make sure the popup button shows the selected value
        cell.selectionPopUpButton.changesSelectionAsPrimaryAction = true
        cell.selectionPopUpButton.showsMenuAsPrimaryAction = true
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
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
