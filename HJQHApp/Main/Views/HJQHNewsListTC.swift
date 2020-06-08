//
//  HJQHNewsListTC.swift
//  HJQHApp
//
//  Created by xjg on 2020/5/28.
//  Copyright © 2020 rui cong. All rights reserved.
//

import UIKit
import SDWebImage
 class HJQHNewsListTC: UITableViewCell {

    @IBOutlet weak var HJQHImageView: UIImageView!
    @IBOutlet weak var HJQHTitleLabel: UILabel!
    @IBOutlet weak var HJQHContentLabel: UILabel!
    @IBOutlet weak var HJQHTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   func HJQHHandleCellWithModel( model:HJQHNewsModel) {
   
        HJQHTimeLabel.text = model.post_date;
        HJQHTitleLabel.text = model.title
        HJQHContentLabel.text = model.desc;
        HJQHImageView.sd_setImage(with: URL(string: model.thumb), completed: nil)
    }
    
}
