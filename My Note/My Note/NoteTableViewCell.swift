//
//  NoteTableViewCell.swift
//  My Note
//
//  Created by muqorrobinaimar on 11/28/17.
//  Copyright © 2017 muqorrobin. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var judul: UILabel!
    @IBOutlet weak var isi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
