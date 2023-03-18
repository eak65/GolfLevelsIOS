//
//  TextFieldCell.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/12/23.
//

import UIKit

class TextFieldCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
