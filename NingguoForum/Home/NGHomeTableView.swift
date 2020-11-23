//
//  NGHomeTableViewController.swift
//  NingguoForum
//
//  Created by zhengsw on 2020/11/12.
//  Copyright © 2020 zhengsw. All rights reserved.
//

import UIKit

class NGHomeTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var datas: Array<IconNavigationModel>!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        datas = Array()
        
        self.backgroundColor = UIColor.gray

        tableView = UITableView(frame: bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NGHomeListCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.reloadData()
    }
    
    func setDatas(dataSource: Icon_navigation) {
        datas = dataSource.items
        tableView.reloadData()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NGHomeListCell

        cell.setModel(model: datas[indexPath.row])
        
        
        return cell
    }
    

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\(indexPath.row)")
    }
    
}
