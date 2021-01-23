//
//  ViewController.swift
//  NingguoForum
//
//  Created by zhengsw on 2020/11/12.
//  Copyright © 2020 zhengsw. All rights reserved.
//

import UIKit

class NGHomeViewController: UIViewController {
    var scrollView: NGHomeScrollView!
    var homeTableView: NGHomeTableView!
    var datas:NSMutableArray!
    var dragCriticalY: CGFloat!
    lazy var gropQueue:DispatchGroup = {
        let grop:DispatchGroup = DispatchGroup.init()
        return grop
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = UIColor(hexString: "#999999");
        datas = NSMutableArray()
        configUI()

        gropQueue.enter()
        //获取轮播图
        HttpManager.sharedInstance.getHomeCircle { [self] (successd:Array<HomeCircle>) in
            print(successd)
            datas.add(successd)
            self.gropQueue.leave()
        } fail: { (fail) in
            
        }

        
        HttpManager.sharedInstance.getIconNavigation(success: { (successd:Icon_navigation) in

//            self.homeTableView.setDatas(dataSource: successd)

        }) { (fail) in

        }

        gropQueue.enter()
        HttpManager.sharedInstance.getHomeList( success: { (successd:Array<HomeListModel>) in
            print(successd)
            self.datas.add(successd)
            self.gropQueue.leave()
        }) { (fail) in
            
        }
        
        gropQueue.notify(queue: DispatchQueue.main){ [self] in
            self.homeTableView.setDatas(dataSource: datas)
        }
        
    }
    
    func configUI() {
        scrollView = NGHomeScrollView()
        scrollView.delegate = self
        scrollView.frame = CGRect.init(x: 0, y: 64+24, width: KSCREEN_WIDTH, height: KSCREEN_HEIGHT-64-49-40)
        self.view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        
        let homeTableView = NGHomeTableView(frame: scrollView.bounds)
        self.homeTableView = homeTableView
//        homeTableView.slideDragBlock{}
        scrollView.addSubview(homeTableView)

        
        
        let dynamicTableView = NGDynamicTableView(frame: CGRect(x: scrollView.frameW, y: 0, width: scrollView.frameW, height: scrollView.frameH))
        scrollView.addSubview(dynamicTableView)
        scrollView.contentSize = CGSize.init(width: scrollView.frameW*2, height: scrollView.frameH)
        
    }
}

extension NGHomeViewController: UIScrollViewDelegate {
     
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("\(scrollView.contentOffset.x)")
        let currentPosition = scrollView.contentOffset.y
//        if currentPosition >= self.dragCriticalY {
//            
//        }else {
//            
//        }
    }
}
