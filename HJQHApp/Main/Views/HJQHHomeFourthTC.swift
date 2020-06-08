//
//  HJQHHomeFourthTC.swift
//  HJQHApp
//
//  Created by xjg on 2020/5/27.
//  Copyright © 2020 rui cong. All rights reserved.
//

import UIKit

@objcMembers class HJQHHomeFourthTC: UITableViewCell {
    
     func show11() {
        print("heee")
    }

    typealias HJQHButtonBlock = (_ button: UIButton?) ->Void
    
    var buttonBlock: HJQHButtonBlock?
    
    

   
    @IBOutlet weak var HJQHFoutLabel: UILabel!
    @IBOutlet weak var HJQHFoutImage: UIImageView!
    @IBOutlet weak var HJQHThirdLabel: UILabel!
    @IBOutlet weak var HJQHThirdImage: UIImageView!
    @IBOutlet weak var HJQHSecondLaebl: UILabel!
    @IBOutlet weak var HJQHSecondImage: UIImageView!
    @IBOutlet weak var HJQHFirstImage: UIImageView!
    @IBOutlet weak var HJQHFirstLabel: UILabel!
    
    
    @IBAction func HJQHFistButton(_ sender: UIButton) {
        if buttonBlock != nil {
            buttonBlock!(sender)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        HJQHFirstImage.image = UIImage.init(named: "HJQH_News")
        HJQHFirstLabel.text = "新闻"
        
        HJQHSecondImage.image = UIImage.init(named: "HJQH_GongLv")
        HJQHSecondLaebl.text = "攻略"
        
        HJQHThirdImage.image = UIImage.init(named: "HJQH_RiLi")
        HJQHThirdLabel.text = "日历"
        
        HJQHFoutImage.image = UIImage.init(named: "HJQH_YinHang")
        HJQHFoutLabel.text = "银行"
    }

   
    
}
