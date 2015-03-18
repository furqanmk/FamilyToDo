//
//  ToDoCell.swift
//  Family ToDo
//
//  Created by Furqan on 2/9/15.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var ToDoTitle: UILabel!
    @IBOutlet weak var ToDoDescription: UILabel!
    @IBOutlet weak var ToDoTimeLeft: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
