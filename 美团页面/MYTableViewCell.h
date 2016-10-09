//
//  MYTableViewCell.h
//  美团
//
//  Created by 千锋 on 16/6/17.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYTableViewCell : UITableViewCell
{
    UIImageView *_imageHeader;
    UILabel * _label;
    //按钮
    UIButton * _selectBtn;
}
//传值方法
-(void)setImageHeader:(NSString *)imageName andLabelText:(NSString *)text;
@end
