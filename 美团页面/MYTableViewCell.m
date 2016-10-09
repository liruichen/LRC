//
//  MYTableViewCell.m
//  美团
//
//  Created by 千锋 on 16/6/17.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "MYTableViewCell.h"

@implementation MYTableViewCell
//初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setttingContent];
    }
    return self;
}
-(void)setttingContent
{
    _imageHeader=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
    [self.contentView addSubview:_imageHeader];
    _label=[[UILabel alloc]initWithFrame:CGRectMake(65, 5, 100, 30)];
    [self.contentView addSubview:_label];
    
    //设置按钮
    _selectBtn=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-40, 5, 50, 40)];
    [_selectBtn setImage:[UIImage imageNamed:@"设置_07@2x"] forState:UIControlStateNormal];
    [self.contentView addSubview:_selectBtn];
    
}
//传值方法
-(void)setImageHeader:(NSString *)imageName andLabelText:(NSString *)text{
    //设置值
    _imageHeader.image = [UIImage imageNamed:imageName];
    _label.text = text;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
