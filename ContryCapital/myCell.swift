//
//  myCell.swift
//  ContryCapital
//
//  Created by iFlame on 9/2/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit
  class myCell: UITableViewCell {
    
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var capital: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
