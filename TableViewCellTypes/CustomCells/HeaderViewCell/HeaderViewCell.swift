//
//  HeaderViewCellTableViewCell.swift
//  TableViewCellTypes
//
//  Created by Mike on 10/11/19.
//  Copyright © 2019 Mike Zarazua. All rights reserved.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
