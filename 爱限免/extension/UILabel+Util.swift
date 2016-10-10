//
//  UILabel+Util.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit

extension UILabel {
    
    class func createLabel(frame: CGRect,title: String?, textAlignment: NSTextAlignment?) -> UILabel {
        
        let label = UILabel(frame: frame)
        
        if let title = title {
            label.text = title
        }
        
        if let textAlignment = textAlignment {
            label.textAlignment = textAlignment
        }
        
        return label
    }
}