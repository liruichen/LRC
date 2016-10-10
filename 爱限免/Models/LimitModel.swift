//
//  LimitModel.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit

class LimitModel: NSObject {

    var applicationId: String?
    var slug: String?
    var name: String?
    
    var releaseDate: String?
    var version: String?
    var desc: String?
    
    var categoryId: NSNumber?
    var categoryName: String?
    var iconUrl: String?
    
    var itunesUrl: String?
    var starCurrent: String?
    var starOverall: String?
    
    var ratingOverall: String?
    var downloads: String?
    var currentPrice: String?
    
    var lastPrice: String?
    var priceTrend: String?
    var expireDatetime: String?
    
    var releaseNotes: String?
    var updateDate: String?
    var fileSize: String?
    
    var ipa: String?
    var shares: String?
    var favorites: String?
    
    
    func setDecription(desc: String) {
        self.desc = desc
    }
    
    //防止没有属性值时，出错
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
