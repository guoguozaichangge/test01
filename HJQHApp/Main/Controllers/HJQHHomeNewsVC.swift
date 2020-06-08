//
//  HJQHHomeNewsVC.swift
//  HJQHApp
//
//  Created by xjg on 2020/5/27.
//  Copyright © 2020 rui cong. All rights reserved.
//

import UIKit
import SwiftyJSON
import GTMRefresh
class HJQHHomeNewsVC: HJQHRootVC {
  
    

    lazy var HJQHTables: UITableView = {
          let cg = CGRect.init(x: 0, y: 0, width:UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height)
        let tables = UITableView.init(frame: cg)
        tables.backgroundColor = UIColor.white
        tables.separatorStyle = UITableViewCell.SeparatorStyle.none
        tables.delegate = self
        tables.dataSource = self
//        tables.register(HJQHNewsListTC.classForCoder(), forCellReuseIdentifier:"HJQHNewsListTC")
//        tables.register(UINib(nibName: "HJQHNewsListTC", bundle: nil), forCellReuseIdentifier: "HJQHNewsListTC")
        tables.register(UINib.init(nibName: "HJQHNewsListTC", bundle: nil), forCellReuseIdentifier: "HJQHNewsListTC")
        return tables
          
      }()
    
    private var HJQHNewsListData = [HJQHNewsModel]()
//    private var HJQHNewsListData = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "新闻"
        HJQHConfigTabels()
        self.HJQHTables.gtm_addRefreshHeaderView {
            self.HJQHDataRequest()
        
        }
        self.HJQHTables.triggerRefreshing()
    }
    
    func HJQHConfigTabels(){
        view.addSubview(HJQHTables)
        
    }
    
    

}

extension HJQHHomeNewsVC {
    func HJQHDataRequest()  {
        var request =
        URLRequest(url: URL(string: "https://api.tzch6.com/Index/NnewsListA")!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "content-type")
        let dict = ["p":"1"]
        let jsonData: Data =
       try! JSONSerialization.data(withJSONObject: dict, options: []) as Data
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { (Data, _, _) in
            DispatchQueue.main.async {
                self.HJQHTables.endRefreshing(isSuccess: true)
            }
            let json  = JSON.init(Data)
        
            if json["code"].intValue == 200 {
               
                for info  in json["data"].arrayValue {
                    let model = HJQHNewsModel(info)
                    self.HJQHNewsListData.append(model)
                }
                DispatchQueue.main.async {
                    
                    self.HJQHTables.reloadData()
                }
            }
            
        }.resume()
        
       }
}
//extension HJQHHomeNewsVC : UITableViewDelegate{
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 100
//        }
//
//}
extension HJQHHomeNewsVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HJQHNewsListTC", for: indexPath) as! HJQHNewsListTC
        if self.HJQHNewsListData.count>0 {
            
            cell.HJQHHandleCellWithModel(model: HJQHNewsListData[indexPath.section] )
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.HJQHNewsListData.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return 150
           }
}
