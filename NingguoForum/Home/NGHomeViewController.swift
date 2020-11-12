//
//  ViewController.swift
//  NingguoForum
//
//  Created by zhengsw on 2020/11/12.
//  Copyright © 2020 zhengsw. All rights reserved.
//

import UIKit

class NGHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = UIColor(hexString: "#999999");
        
        
        HttpManager.sharedInstance.getChannelList(success: { (success) in
            
        }) { (fail) in
            
        }

    }

}

