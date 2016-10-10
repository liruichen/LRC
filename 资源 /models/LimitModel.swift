//
//  LimitModel.swift
//  LimitFree1606
//
//  Created by gaokunpeng on 16/7/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class LimitModel: NSObject {

    var applicationId: String?
    var slug: String?
    var name: String?
    var releaseDate: String?
    var version: String?
    var myDescription: String?
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
    
    func setDescription(desc: String){
        self.myDescription = desc
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
