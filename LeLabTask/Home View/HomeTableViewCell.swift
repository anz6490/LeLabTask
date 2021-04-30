//
//  HomeTableViewCell.swift
//  LeLabTask
//
//  Created by Anees Mv on 29/04/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var rightArrowIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
