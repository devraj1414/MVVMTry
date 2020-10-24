//
//  AlbumCell.swift
//  MVVMTry
//
//  Created by Suruchi Kumari on 24/10/20.
//  Copyright © 2020 Suruchi Kumari. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    var albumCellViewModel : AlbumCellViewModel?{
        didSet{
            self.artistLabel.text = albumCellViewModel?.artist
            self.titleLabel.text = albumCellViewModel?.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
