//
//  MyAccountViewController.m
//  美团页面
//
//  Created by 千锋 on 16/6/17.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableV;
}
@end

@implementation MyAccountViewController
-(void)createUI{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 420, 340, 40)];
    [btn setTitle:@"退出账号" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor orangeColor];
    _tableV=(UITableView *)[self.view viewWithTag:200];
    [_tableV addSubview:btn];
}
-(void)createTableView{
    _tableV=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:_tableV];
    _tableV.tag=200;
    _tableV.delegate=self;
    _tableV.dataSource=self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    self.title=@"我的账户";
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //
    cell.textLabel.text=@"钱多多mdf";
    cell.imageView.image=[UIImage imageNamed:@"我的－登录_6@2x"];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//返回分组头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    view.backgroundColor=[UIColor cyanColor];
    return view;
}
//返回分组尾
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    view.backgroundColor=[UIColor greenColor];
    return view;
}
//必须设置分组头  分组尾的 高度
//设置分组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

//设置分组尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 44;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
