//
//  HJQHNewsModel.swift
//  HJQHApp
//
//  Created by xjg on 2020/5/28.
//  Copyright © 2020 rui cong. All rights reserved.
//

import UIKit
import SwiftyJSON
//class HJQHNewsModel: NSObject {
//    var post_date = ""
//    var desc = ""
//    var tid = 0
//    var title = ""
//    var thumb = ""
//
//    init(jsonData: JSON) {
//        post_date = jsonData["post_date"].stringValue
//        desc = jsonData["desc"].stringValue
//    }
//
//
//}
struct HJQHNewsModel {
    var post_date: String = ""
    var desc: String = ""
    var tid: Int = 0
    var title: String = ""
    var thumb: String = ""
    
}

extension HJQHNewsModel {
    init(_ json: JSON) {
        post_date = json["post_date"].stringValue
        desc = json["desc"].stringValue
        tid = json["tid"].intValue
        title = json["title"].stringValue
        thumb = json["thumb"].stringValue
        
    }
}
