//
//  HJQHRootVC.swift
//  HJQHApp
//
//  Created by xjg on 2020/5/27.
//  Copyright © 2020 rui cong. All rights reserved.
//

import UIKit

class HJQHRootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "HJQH_Back")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(HJQHBack))
    }
    
   @objc func HJQHBack()  {
    self.navigationController?.popViewController(animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
