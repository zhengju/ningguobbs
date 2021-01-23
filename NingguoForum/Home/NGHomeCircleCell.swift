//
//  NGHomeCircleCell.swift
//  NingguoForum
//
//  Created by zhengsw on 2021/1/23.
//  Copyright © 2021 zhengsw. All rights reserved.
//

import UIKit

class NGHomeCircleCell: UITableViewCell {
    var circleView:ZJCircleView! = nil
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        circleView = ZJCircleView(frame:CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height: 100))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(circleView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(datas:Array<HomeCircle>){
        let titles = NSMutableArray()
        let imgUrls = NSMutableArray()
        for  model in datas {
            titles.add(model.title)
            let dict = model.pic_arr[0] as! NSDictionary
            imgUrls.add(dict.object(forKey: "url") as! String)
        }
        circleView.titles = titles as! [String]
        circleView.setImageNames(images: imgUrls as! Array<Any>)
    }
    
}
