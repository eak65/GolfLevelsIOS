//
//  TeamSelectCell.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/12/23.
//

import UIKit

class TeamSelectCell: UITableViewCell {

    @IBOutlet weak var selectionPopUpButton: UIButton!
    @IBOutlet weak var teamNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
