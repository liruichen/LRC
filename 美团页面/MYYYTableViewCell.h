//
//  MYYYTableViewCell.h
//  美团页面
//
//  Created by 千锋 on 16/6/17.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyModel;
@interface MYYYTableViewCell : UITableViewCell
{
    UIImageView *_imageView;
   
}
@property UILabel *titleLabel;
@property UILabel *numberLabel;

- (void) setContent: (MyModel *) messageModel;

@end
