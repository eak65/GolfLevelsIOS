//
//  UserCell.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/12/23.
//

import UIKit

class UserCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lowerDetailLabel: UILabel!
    var buttonPress : ((UIButton) -> ())?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        guard let buttonPress = buttonPress, let sender = sender as? UIButton else {
            fatalError()
        }
        buttonPress(sender)
    }

}
