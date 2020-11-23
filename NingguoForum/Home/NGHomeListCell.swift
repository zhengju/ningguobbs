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
    let numLabel:UILabel! //图片
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        titleLable = UILabel()
        sourceLable = UILabel()
        infoImg = UIImageView()
        numLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLable.text = "老宁中旁边书香名邸1号楼1楼房屋出租 ";
        titleLable.numberOfLines = 2;
        contentView.addSubview(titleLable)
        
        sourceLable.text = "中国新闻网";
        sourceLable.font = UIFont.systemFont(ofSize: 14)
        sourceLable.textColor = RGB_COLOR(r: 175, g: 175, b: 175)
        contentView.addSubview(sourceLable)

        infoImg.image = UIImage.init(imageLiteralResourceName: "home");
        contentView.addSubview(infoImg)
        
        numLabel.font = UIFont.systemFont(ofSize: 12)
        numLabel.text = "6133 阅读"
        numLabel.textColor = RGB_COLOR(r: 175, g: 175, b: 175)
        contentView.addSubview(numLabel)
        
        
        titleLable.snp.makeConstraints { (make) ->Void in
            make.left.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(20)
            make.right.equalTo(infoImg.snp.left).offset(-20)
        }
        
        sourceLable.snp.makeConstraints { (make) ->Void  in
            make.left.equalTo(titleLable)
            make.bottom.equalTo(contentView).offset(-20)
        }
        numLabel.snp.makeConstraints { (make) ->Void  in
            make.left.equalTo(sourceLable.snp.right).offset(5)
            make.centerY.equalTo(sourceLable.snp.centerY)
        }
        
        infoImg.snp.makeConstraints { (make) ->Void in
            make.right.equalTo(contentView).offset(-20)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize(width: 90, height: 70))
        }

        infoImg.kf.setImage(with: URL(string: "http://app-image.ngbbs.cn/pic/20201112/1605178806437369855.jpg"))
        
    }
    func setModel(model: IconNavigationModel){
//        sourceLable.text = infoModel.source;
        titleLable.text = model.title;
//        dateLabel.text = DateUtil.timeBetween(date: infoModel.pubDate!)

        infoImg.kf.setImage(
            with: URL(string: model.pic));
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
