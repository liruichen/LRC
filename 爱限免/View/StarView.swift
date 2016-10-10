//
//  StarView.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit

class StarView: UIView {

    private var fgImageView: UIImageView?

    //通过XIB初始化时调用
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // print(#function)
        initImageView()
    }
    
    func initImageView() {
        let bgiv = UIImageView(frame: CGRectMake(0, 0, 65, 23))
        bgiv.image = UIImage(named: "StarsBackground")
        addSubview(bgiv)
        
        fgImageView = UIImageView(frame: CGRectMake(0, 0, 65, 23))
        fgImageView?.image = UIImage(named: "StarsForeground")
        
        //切割视图
        fgImageView?.contentMode = .Left
        fgImageView?.clipsToBounds = true
        
        addSubview(fgImageView!)
    }
    
    func setStarRating(rat: String) {
        let value = CGFloat(NSString(string: rat).floatValue)
        fgImageView?.frame.size.width = 65*(value/5.0)
    }

}
