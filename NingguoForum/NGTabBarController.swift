//
//  NGTabBarController.swift
//  NingguoForum
//
//  Created by zhengsw on 2020/11/12.
//  Copyright © 2020 zhengsw. All rights reserved.
//

import UIKit

class NGTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = ViewController()
        let nav1 = UINavigationController(rootViewController: v1)
        let v2 = NGbbsViewController()
        let nav2 = UINavigationController(rootViewController: v2)
        nav1.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        nav2.tabBarItem = UITabBarItem.init(title: "逛论坛", image: UIImage(named: "message"), selectedImage: UIImage(named: "message_1"))
        self.tabBar.shadowImage = nil
        self.viewControllers = [nav1, nav2]
    }
}
