//
//  ImageTableViewCell.swift
//  FoodView
//
//  Created by 邱欣宇 on 10/1/23.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var lblImage: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
