//
//  UserHoleCell.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 4/1/23.
//

import UIKit

class UserHoleCell: UITableViewCell, UITextFieldDelegate{

    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        textBox.delegate = self
        self.textBox.text = "2"
        self.stepper.value = 2.0
        self.stepper.minimumValue = 0
        self.stepper.maximumValue = 100
        // Initialization code
    }

    @IBAction func valueChanged(_ sender: Any) {
        guard let sender = sender as? UIStepper else {
            fatalError()
        }
        textBox.text = "\(Int(sender.value))"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(false)
    }

}
