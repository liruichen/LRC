//
//  DetailItem.swift
//  LimitFree1606
//
//  Created by gaokunpeng on 16/7/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class DetailItem: NSObject {

    var applicationId: String?
    var slug: String?
    var name: String?
    var releaseDate: String?
    var currentVersion: String?
    var currentPrice: String?
    var lastPrice: String?
    var priceTrend: String?
    var expireDatetime: String?
    var categoryId: NSNumber?
    var categoryName: String?
    var fileSize: String?
    var myDescription: String?
    var description_long: String?
    var systemRequirements: String?
    var sellerId: String?
    var sellerName: String?
    var language: String?
    var iconUrl: String?
    var itunesUrl: String?
    var downloads: String?
    var starCurrent: String?
    var starOverall: String?
    var ratingOverall: String?
    var releaseNotes: String?
    var updateDate: String?
    var appurl: String?
    var newversion: String?
    var photoArray: NSArray?

    
    func setDescription(desc: String){
        self.myDescription = desc
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}


class PhotoItem: NSObject {
    
    var smallUrl: String?
    var originalUrl: String?
    
}


