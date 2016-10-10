//
//  UIButton+Util.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit
extension UIButton {
    
    class func createButton(frame: CGRect, title: String?, bgImage: String?, target: AnyObject?, action: Selector) -> UIButton {
        
        let btn = UIButton(type: .Custom)
        btn.frame = frame
        if let title = title {
            btn.setTitle(title, forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            
        }
        
        if let bgImage = bgImage {
            btn.setBackgroundImage(UIImage(named: bgImage), forState: .Normal)
        }
        
        if let target = target {
            btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
        
        return btn
    }
}
