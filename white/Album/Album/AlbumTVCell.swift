//
//  AlbumTVCell.swift
//  Album
//
//  Created by hoemoon on 29/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class AlbumTVCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
