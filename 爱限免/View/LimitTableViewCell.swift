//
//  LimitTableViewCell.swift
//  爱限免
//
//  Created by ll on 16/9/26.
//  Copyright © 2016年 ll. All rights reserved.
//

import UIKit
import Kingfisher
class LimitTableViewCell: UITableViewCell {
    
    private var lineView: UIView?
    @IBOutlet weak var bgImageView: UIImageView!

    @IBOutlet weak var appImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var lastPriceLabel: UILabel!
    
    @IBOutlet weak var myStarView: StarView!
    
    @IBOutlet weak var catagoryLabel: UILabel!
    
    @IBOutlet weak var shareLabel: UILabel!
    
    @IBOutlet weak var favoriteLabel: UILabel!
    
    @IBOutlet weak var downloadlabel: UILabel!
    
    
    func config(model: LimitModel, atIndex index: Int) {
        
        if index % 2 == 0 {
            bgImageView.image = UIImage(named: "cate_list_bg1")
        }else {
            bgImageView.image = UIImage(named: "cate_list_bg2")
        }
        
        let url = NSURL(string: model.iconUrl!)
        appImageView.kf_setImageWithURL(url!)
        
        nameLabel.text = "\(index)." + model.name!
        
        //时间
        let index = model.expireDatetime?.endIndex.advancedBy(-2)
        
        let expireDatestr = model.expireDatetime?.substringToIndex(index!)
        
        let df = NSDateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let expireDate = df.dateFromString(expireDatestr!)
        
        //日历对象
        let cal = NSCalendar.currentCalendar()
        
       
        
        let unit =  NSCalendarUnit(rawValue: NSCalendarUnit.Hour.rawValue | NSCalendarUnit.Minute.rawValue|NSCalendarUnit.Second.rawValue)
        //计算两个日期的时间差
        let date = cal.components(unit, fromDate:NSDate() , toDate: expireDate!, options: .MatchStrictly)
        timeLabel.text = String(format: "剩余：%02ld:%02ld:%02ld", date.hour, date.minute, date.second)
        //原价
        let priceStr = "$:"+model.lastPrice!
        lastPriceLabel.text = priceStr
        
        //横线
        if lineView == nil {
            lineView = UIView(frame: CGRectMake(0,10,60,2))
            lineView!.backgroundColor = UIColor.blackColor()
            lastPriceLabel.addSubview(lineView!)
        }
        
        //星级
        myStarView.setStarRating(model.starCurrent!)
        
        //类型
        catagoryLabel.text = MyUtil.transferCateName(model.categoryName!)
        
        //分享，收藏，下载
        shareLabel.text = "分享:" + model.shares! + "次"
        favoriteLabel.text = "收藏:" + model.favorites! + "次"
        downloadlabel.text = "下载" + model.downloads! + "次"
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
