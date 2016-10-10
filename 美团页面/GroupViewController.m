//
//  GroupViewController.m
//  美团
//
//  Created by 千锋 on 16/6/16.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "GroupViewController.h"
#import "FirstShowViewController.h"
#import "MyViewController.h"
@interface GroupViewController ()
{
    UITableView *_tableV;
}
@end

@implementation GroupViewController
-(void)createUI{
    //UINavigationController * navi=[[UINavigationController alloc]init];
    UISegmentedControl *segC=[[UISegmentedControl alloc]initWithFrame:CGRectMake(50, 100, 200, 30)];
    segC.tag=100;
    //插入item
    [segC insertSegmentWithTitle:@"全部用户" atIndex:0 animated:YES];
    [segC insertSegmentWithTitle:@"团购用户" atIndex:1 animated:YES];
    //添加事件
    [segC addTarget:self action:@selector(segCChanged:) forControlEvents:UIControlEventValueChanged];
    //把segC加到navi上
    self.navigationItem.titleView =segC;
}
-(void)settingNavi{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"团购_全部分类_美食_03@2x"] style:UIBarButtonItemStylePlain target:nil action:@selector(leftBtn:)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"团购_全部分类_美食_05@2x"] style:UIBarButtonItemStylePlain target:nil action:@selector(rightBtn:)];
}
-(void)createTableView{
    _tableV=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableV.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_tableV];
    UIImageView *iv=[[UIImageView alloc]initWithFrame:self.view.frame];
    iv.image=[UIImage imageNamed:@"团购_搜索-详情页面.jpg"];
    [_tableV addSubview:iv];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
   // [self settingNavi];
    [self settingNavi];
    [self createTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)segCChanged:(UISegmentedControl *)segC{
    NSInteger index=segC.selectedSegmentIndex;
    NSLog(@"%lu",index);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)leftBtn:(UIButton *)leftBtn{
    FirstShowViewController * sv=[[FirstShowViewController alloc]init];
    [self presentViewController:sv animated:YES completion:nil];
}
-(void)rightBtn:(UIButton *)rightBtn{
    MyViewController *vc=[[MyViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
