//
//  MYYYTableViewCell.m
//  美团页面
//
//  Created by 千锋 on 16/6/17.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "MYYYTableViewCell.h"
#import "MyModel.h"
@implementation MYYYTableViewCell

#pragma mark - init
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 12.5, 20, 20)];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(45, 0, 75, 45)];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_titleLabel];
        
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 25, 0, 50, 45)];
        _numberLabel.textAlignment = NSTextAlignmentRight;
        _numberLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_numberLabel];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - action
- (void) setContent: (MyModel *) myModel {
    _imageView.image=[UIImage imageNamed:myModel.image];
    _titleLabel.text=myModel.title;
    _numberLabel.text=myModel.number;
}

@end
