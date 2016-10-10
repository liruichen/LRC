//
//  SubjectItem.swift
//  LimitFree1606
//
//  Created by gaokunpeng on 16/7/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class SubjectItem: NSObject {
    
    var title: String?
    var img: String?
    var desc_img: String?
    var desc: String?
    var date: String?
    
    var appArray: NSArray?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    

}


class AppItem: NSObject {
    
    var applicationId: String?
    var name: String?
    var iconUrl: String?
    var starOverall: String?
    var ratingOverall: String?
    var downloads: String?
    
    var comment: NSNumber?
    
    
    
}
