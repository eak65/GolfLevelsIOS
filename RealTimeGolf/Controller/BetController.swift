//
//  BetController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 4/1/23.
//

import UIKit

class BetController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var betTextField: UITextField!
    var nextButtonPressed : (()->())?
    var users = [User]()
    var betValue  = 50
    override func viewDidLoad() {
        super.viewDidLoad()
        betTextField.keyboardType = .numberPad
        betTextField.returnKeyType = .done
        addDoneButtonOnKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
        self.betTextField.text = "\(betValue)"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func addDoneButtonOnKeyboard()
    {
        var doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = .default

        var flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        var done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))

        var items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)

        doneToolbar.items = items as! [UIBarButtonItem]
        doneToolbar.sizeToFit()

        self.betTextField.inputAccessoryView = doneToolbar

    }

    @objc func doneButtonAction()
    {
        
        self.betTextField.resignFirstResponder()
        betValue = Int(self.betTextField.text ?? "50") ?? betValue
        self.tableView.reloadData()

    }
    

    @IBAction func nextButton(_ sender: Any) {
        nextButtonPressed?()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(false)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BetCell") as? BetCell else {
            fatalError()
        }
        cell.leftLabel.text = users[indexPath.row].name
        cell.rightLabel.text = "$\(betValue)"
        return cell
    }
}
