//
//  ViewController.swift
//  NingguoForum
//
//  Created by zhengsw on 2020/11/12.
//  Copyright © 2020 zhengsw. All rights reserved.
//

import UIKit

class NGHomeViewController: UIViewController {
    var scrollView: UIScrollView!
    var homeTableView: NGHomeTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = UIColor(hexString: "#999999");
        configUI()

        HttpManager.sharedInstance.getIconNavigation(success: { (successd:Icon_navigation) in

//            self.homeTableView.setDatas(dataSource: successd)

        }) { (fail) in

        }

        
        HttpManager.sharedInstance.getHomeList(success: { (successd:Array<HomeListModel>) in
            print(successd)
            
            self.homeTableView.setDatas(dataSource: successd)
            
        }) { (fail) in
            
        }
        
    }
    
    func configUI() {
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.frame = CGRect.init(x: 0, y: 64+40, width: KSCREEN_WIDTH, height: KSCREEN_HEIGHT-64-49-40)
        self.view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        
        let homeTableView = NGHomeTableView(frame: scrollView.bounds)
        self.homeTableView = homeTableView
        scrollView.addSubview(homeTableView)
        
        let dynamicTableView = NGDynamicTableView(frame: CGRect(x: scrollView.frameW, y: 0, width: scrollView.frameW, height: scrollView.frameH))
        scrollView.addSubview(dynamicTableView)
        scrollView.contentSize = CGSize.init(width: scrollView.frameW*2, height: scrollView.frameH)
        
    }
}

extension NGHomeViewController: UIScrollViewDelegate {
     
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("\(scrollView.contentOffset.x)")
    }
}
