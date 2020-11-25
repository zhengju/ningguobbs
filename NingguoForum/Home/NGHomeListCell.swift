//
//  NGHomeListCell.swift
//  NingguoForum
//
//  Created by zhengsw on 2020/11/13.
//  Copyright © 2020 zhengsw. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class NGHomeListCell: UITableViewCell {

    let titleLable:UILabel! //标题
    let sourceLable:UILabel! //来源
    let infoImg:UIImageView! //图片
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        
        
        titleLable = UILabel()
        sourceLable = UILabel()
        infoImg = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        titleLable.text = "--";
        titleLable.numberOfLines = 2;
        contentView.addSubview(titleLable)
        
        sourceLable.text = "--";
        sourceLable.font = UIFont.systemFont(ofSize: 14)
        sourceLable.textColor = RGB_COLOR(r: 175, g: 175, b: 175)
        contentView.addSubview(sourceLable)

        infoImg.image = UIImage.init(imageLiteralResourceName: "home");
        contentView.addSubview(infoImg)

        titleLable.snp.makeConstraints { (make) ->Void in
            make.left.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(20)
            make.right.equalTo(infoImg.snp.left).offset(-20)
        }
        
        sourceLable.snp.makeConstraints { (make) ->Void  in
            make.left.equalTo(titleLable)
            make.bottom.equalTo(contentView).offset(-20)
        }

        infoImg.snp.makeConstraints { (make) ->Void in
            make.right.equalTo(contentView).offset(-20)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize(width: 90, height: 70))
        }

        infoImg.kf.setImage(with: URL(string: "http://app-image.ngbbs.cn/pic/20201112/1605178806437369855.jpg"))
        
    }
    func setModel(model: HomeListModel){

        titleLable.text = model.title;
        sourceLable.text = model.from

        let urlDict = model.pics_arr.first as! [String : Any]
        let pic = urlDict["url"] as! String
        
        infoImg.kf.setImage(
            with: URL(string: pic));
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
