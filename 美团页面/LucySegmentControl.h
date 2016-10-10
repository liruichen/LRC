//
//  LucySegmentControl.h
//  SegmentCChangePage
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LucySCDelegate <NSObject>

-(void)btnWasClick:(NSInteger) btnIndex;

@end



@interface LucySegmentControl : UIView
{
    //里面存放的是 按钮的信息
    NSMutableArray *_items;
}

@property (nonatomic,weak) id<LucySCDelegate>delegate;

//传入要创建的 按钮个数 已经 按钮的标题
-(void)setItems:(NSArray *)itemsSetting;




@end
