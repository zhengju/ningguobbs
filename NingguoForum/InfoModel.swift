//
//  InfoModel.swift
//  InfoAPP
//
//  Created by leeco on 2019/5/6.
//  Copyright © 2019 zsw. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeCircle: Mappable {
    
    var title: String
    var link: String
    var pic_arr: Array<Any>
    required init?(map: Map) {
        title = ""
        link = ""
        pic_arr = []
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        link <- map["link"]
        pic_arr <- map["pic_arr"]
    }
    
}

class Icon_navigation: Mappable {
    
    var items: Array<IconNavigationModel>
    
    required init?(map: Map) {
        items = []
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
    
}

class IconNavigationModel: Mappable {
    var link: String
    var title: String
    var pic :String
    required init?(map: Map) {
        link = ""
        title = ""
        pic = ""
    }
    func mapping(map: Map) {
        link <- map["link"]
        title <- map["title"]
        pic <- map["pic"]
    }
    
}

class HomeListModel: Mappable {
    var link: String
    var title: String
    var pics_arr :Array<Any>
    var from :String
    required init?(map: Map) {
        link = ""
        title = ""
        pics_arr = Array()
        from = ""
    }
    func mapping(map: Map) {
        link <- map["link"]
        title <- map["title"]
        pics_arr <- map["pics_arr"]
        
        if pics_arr.count == 0 {
            pics_arr <- map["pic_arr"]
        }
        
        from <- map["from"]
    }
    
}

class ChannelListModel: Mappable {
    
    var name: String!
    var channelId: String!
    var index = 0
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        channelId       <- map["channelId"]
    }
        
}

class InfoModel: Mappable {
    
    var author_name: String!
    var title: String!
    var url: String!
    var thumbnail_pic_s: String!
    var date: Date!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        author_name <- map["author_name"]
        title       <- map["title"]
        url         <- map["url"]
        thumbnail_pic_s <- map["thumbnail_pic_s"]
        date <- (map["date"],ObjectMapperDateTransform())
    }
}

/***********listModel*************/

class ImageurlModel: Mappable {
    var url: String!
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
    }
    
    
}

class ContentlistModel: Mappable {
    var allList: Array<Any>!
    var id: String!
    var channelId: String!
    var img: String!
    var havePic: Bool!
    var pubDate: Date!
    var title: String!
    var source: String!
    var imageurls: Array<ImageurlModel>!
    var link: String!
    var channelName: String!
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        allList <- map["allList"]
        id <- map["id"]
        channelId <- map["channelId"]
        img <- map["img"]
        img <- map["thumbnail_pic_s"]
        havePic <- map["havePic"]
        imageurls <- map["imageurls"]
        link <- map["link"]
        link <- map["url"]
        title <- map["title"]
        source <- map["source"]
        source <- map["author_name"]
        channelName <- map["channelName"]
        pubDate <- (map["pubDate"],ObjectMapperDateTransform1())
        pubDate <- (map["date"],ObjectMapperDateTransform())
    }
}
