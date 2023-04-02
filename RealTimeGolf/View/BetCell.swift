//
//  BetCell.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 4/2/23.
//

import UIKit

class BetCell: UITableViewCell {
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
