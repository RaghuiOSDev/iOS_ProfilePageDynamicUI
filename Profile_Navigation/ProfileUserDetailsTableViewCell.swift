//
//  ProfileUserDetailsTableViewCell.swift
//  Profile_Navigation
//
//  Created by Raghu on 28/02/23.
//

import UIKit

class ProfileUserDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var LabelfirstName: UILabel!
    @IBOutlet weak var textFieldFirstName: UITextField!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
