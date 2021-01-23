//
//  NGHomeTableViewController.swift
//  NingguoForum
//
//  Created by zhengsw on 2020/11/12.
//  Copyright © 2020 zhengsw. All rights reserved.
//

import UIKit
//类似于OC中的typedef
typealias sendValueClosure=()->Void
class NGHomeTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    var tableView: NGHomeTable!
    var datas: NSMutableArray!
    var _currOffsetY:CGFloat!
    var canSlide:Bool!
    //声明一个闭包
    var slideDragBlock:sendValueClosure?
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        _currOffsetY = 0.0
        datas = NSMutableArray()
        
        self.backgroundColor = UIColor.gray

        tableView = NGHomeTable(frame: bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NGHomeListCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.register(NGHomeCircleCell.classForCoder(), forCellReuseIdentifier: "circleCell")
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.reloadData()
    }
    
    func setDatas(dataSource: NSMutableArray) {

        datas = dataSource
        tableView.reloadData()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        
        return datas.count
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            let array = datas[section] as! Array<Any>
            return array.count
        }
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "circleCell", for: indexPath) as! NGHomeCircleCell
            let array = datas[indexPath.section] as! Array<HomeCircle>
            cell.setModel(datas: array)
            return cell
        }else {
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NGHomeListCell
            let array = datas[indexPath.section] as! Array<HomeListModel>
            cell.setModel(model: array[indexPath.row])
            return cell
        }

    }
    

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\(indexPath.row)")
    }
    
}

extension NGHomeTableView:UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        _currOffsetY = scrollView.contentOffset.y
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !canSlide {
            scrollView.contentOffset = CGPoint.init(x: 0, y: scrollView.contentOffset.y == 0 ?0:_currOffsetY)
        }
        _currOffsetY = scrollView.contentOffset.y
        if scrollView.contentOffset.y<0 {
            canSlide = false
            scrollView.contentOffset = CGPoint.zero
            //通知父视图
            if (slideDragBlock != nil) {
                self.slideDragBlock!()
            }
        }
    }
}
