//
//  LucySegmentControl.m
//  SegmentCChangePage
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LucySegmentControl.h"

@implementation LucySegmentControl
{
    //上一次 被点击的 btn的tag值
    NSInteger previousTag;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        _items = [[NSMutableArray alloc]init];
    }
    return self;
}


-(void)setItems:(NSArray *)itemsSetting
{
    NSInteger count = itemsSetting.count;
    //每个按钮的宽度
    float itemW = self.frame.size.width / count - 2;
    
    previousTag = 0;
    
    for (int i = 0; i<count; i++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(1+i*(itemW+1), 1, itemW,self.frame.size.height-2)];
        [btn setTitle:itemsSetting[i] forState:UIControlStateNormal];
        btn.tag = 200 +i;
        [btn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:@"43_1.jpg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"43_14.jpg"] forState:UIControlStateSelected];
        if(i == 0)
        {
            btn.selected =YES;
        }
        
        [self addSubview:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)btnClick:(UIButton *)btn
{
    
    //选择的是第几个下标呢
    NSInteger index = btn.tag - 200;
    
    if (index == previousTag)
    {
        
    }
    else
    {
        //将原来的btn设置为非选中状态
        UIButton *btn1 =(UIButton *)[self viewWithTag:previousTag +200];
        btn1.selected = NO;
        
        //现在点钟的btn设置为选中状态
        btn.selected =YES;
        
        previousTag  = index;
        //将值 进行 回传
        [self.delegate btnWasClick:index];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
