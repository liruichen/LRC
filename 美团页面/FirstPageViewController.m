//
//  FirstPageViewController.m
//  美团
//
//  Created by 千锋 on 16/6/16.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "FirstPageViewController.h"
#import "FirstShowViewController.h"
#define W self.view.frame.size.width
#define H self.view.frame.size.height


@interface FirstPageViewController ()<UIScrollViewDelegate>

@end

@implementation FirstPageViewController
-(void)createScrollerView{
    UIScrollView *sv=[[UIScrollView alloc]initWithFrame:self.view.frame];
    sv.tag=200;
    [self.view addSubview:sv];
    sv.contentSize=CGSizeMake(3*W,H);
    sv.pagingEnabled=YES;
    for (int i=0; i<3; i++) {
        UIImageView *iv=[[UIImageView alloc]initWithFrame:CGRectMake(i*W, 0, W, H)];
        iv.image=[UIImage imageNamed:[NSString stringWithFormat:@"引导页－%d.jpg",i+1]];
        sv.delegate=self;
        [sv addSubview:iv];
    }
}
-(void)createPageControl{
    UIPageControl * pageC=[[UIPageControl alloc]initWithFrame:CGRectMake(W, H-70, 200, 50)];
    [self.view addSubview:pageC];
    //设置全部点 有多少页  显示多少点
    pageC.numberOfPages=3;
    //设置当前点
    pageC.currentPage=0;
    //设置指示颜色
    pageC.pageIndicatorTintColor=[UIColor blackColor];
    //设置当前页只是颜色
    pageC.currentPageIndicatorTintColor=[UIColor orangeColor];
    pageC.tag=300;
    [pageC addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
}
-(void)createUI{
    }
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollerView];
    [self createPageControl];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(3.0*W, H-100, 100, 66)];
    btn.center=CGPointMake(W, H-100);
    [btn setTitle:@"马上进入" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor blackColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIScrollView *sv=(UIScrollView *)[self.view viewWithTag:200];
    [sv addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-action
-(void)btnClick:(UIButton *)btn{
    FirstShowViewController * vc=[[FirstShowViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)changePage:(UIPageControl *)pageC{
    //获得当前是第几页
    NSInteger index=pageC.currentPage;
    NSLog(@"%lu",index);
    //切换对应的scrollerview界面
    UIScrollView *sv=(UIScrollView *)[self.view viewWithTag:200];
    //切换页数
    sv.contentOffset=CGPointMake(index *W, 0);
    
}
#pragma mark-delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //或的偏移量
    float x_dis=scrollView.contentOffset.x;
    //偏移了几页
    NSInteger index=x_dis/W;
    if (index *W==x_dis) {
        UIPageControl *pageC=(UIPageControl *)[self.view viewWithTag:300];
        pageC.currentPage=index;
    }
}
@end
