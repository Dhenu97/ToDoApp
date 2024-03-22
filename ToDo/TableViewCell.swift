//
//  TableViewCell.swift
//  ToDo
//
//  Created by dhenu on 11/24/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var endDateLbl: UILabel!
    
    @IBOutlet weak var strtDateLbl: UILabel!
    
    @IBOutlet weak var taskDescriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
