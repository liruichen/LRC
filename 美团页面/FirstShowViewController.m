//
//  FirstShowViewController.m
//  美团页面
//
//  Created by 千锋 on 16/6/18.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "FirstShowViewController.h"
#import "GroupViewController.h"
#import "MYTableViewCell.h"
@interface FirstShowViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating>
{
    UITableView * _tableV;
    NSMutableArray *_dataSource;
    //定义一个成员变量 搜索框
    UISearchBar * _searchBar;
}

@end

@implementation FirstShowViewController
-(void)readData
{
    _dataSource = [[NSMutableArray alloc]init];
    for (int i =0; i<15; i++) {
        [_dataSource addObject:[NSString stringWithFormat:@"43_%d.jpg",i+1]];
    }
}
-(void)createUI
{
    _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 235, self.view.frame.size.width, 553)];
    _tableV.delegate=self;
    _tableV.dataSource=self;
    
    _tableV.rowHeight = 70;
    [self.view addSubview:_tableV];
    //注册Cell 跟tableView的创建写在一起
    //第一个参数  是要注册的Cell类
    //第二个参数  是Cell的复用标志
    [_tableV registerClass:[MYTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //将搜索框 进行初始化
    _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 40)];
    self.title=@"搜索商品";
    _searchBar.backgroundColor=[UIColor redColor];
    //UIImageView *iv=[self.view viewWithTag:200];
    //放到表头
    //_tableV.tableHeaderView=_searchBar;
    [self.view addSubview:_searchBar];
    
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(3, 225, 77, 10)];
    label.text=@"猜你喜欢";
    [self.view addSubview:label];
    
}
-(void)showPhoto{
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(10, 60, 26,26)];
    [btn1 setImage:[UIImage imageNamed:@"首页_11@2x"] forState:UIControlStateNormal];
    [btn1 setTitle:@"美食" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置缩进
    //上 左  下 右
    [btn1 setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -80, -44, -105)];
    [self.view addSubview:btn1];
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(100, 60, 26,26)];
    [btn2 setImage:[UIImage imageNamed:@"首页_12@2x"] forState:UIControlStateNormal];
    [btn2 setTitle:@"电影" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置缩进
    //上 左  下 右
    [btn2 setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, -80, -44, -105)];
    [self.view addSubview:btn2];
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(190, 60, 26,26)];
    [btn3 setImage:[UIImage imageNamed:@"首页_13@2x"] forState:UIControlStateNormal];
    [btn3 setTitle:@"酒店" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置缩进
    //上 左  下 右
    [btn3 setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    [btn3 setTitleEdgeInsets:UIEdgeInsetsMake(0, -80, -44, -105)];
    [self.view addSubview:btn3];
    
    
    UIButton *btn4=[[UIButton alloc]initWithFrame:CGRectMake(280, 60, 26,26)];
    [btn4 setImage:[UIImage imageNamed:@"首页_14@2x"] forState:UIControlStateNormal];
    [btn4 setTitle:@"KTV" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置缩进
    //上 左  下 右
    [btn4 setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    [btn4 setTitleEdgeInsets:UIEdgeInsetsMake(0, -80, -44, -105)];
    [self.view addSubview:btn4];
    //5
    UIButton *btn5=[[UIButton alloc]initWithFrame:CGRectMake(10, 155, 26,26)];
    [btn5 setImage:[UIImage imageNamed:@"首页_15@2x"] forState:UIControlStateNormal];
    [btn5 setTitle:@"小吃" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置缩进
    //上 左  下 右
    [btn5 setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    [btn5 setTitleEdgeInsets:UIEdgeInsetsMake(0, -80, -44, -105)];
    [self.view addSubview:btn5];
    
    //6
    UIButton *btn6=[[UIButton alloc]initWithFrame:CGRectMake(100, 155, 26,26)];
    [btn6 setImage:[UIImage imageNamed:@"首页_16@2x"] forState:UIControlStateNormal];
    [btn6 setTitle:@"休闲娱乐" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置缩进
    //上 左  下 右
    [btn6 setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    [btn6 setTitleEdgeInsets:UIEdgeInsetsMake(0, -80, -44, -105)];
    [self.view addSubview:btn6];
    
    //7
    UIButton *btn7=[[UIButton alloc]initWithFrame:CGRectMake(190, 155, 26,26)];
    [btn7 setImage:[UIImage imageNamed:@"首页_17@2x"] forState:UIControlStateNormal];
    [btn7 setTitle:@"今日新品" forState:UIControlStateNormal];
    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置缩进
    //上 左  下 右
    [btn7 setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    [btn7 setTitleEdgeInsets:UIEdgeInsetsMake(0, -80, -44, -105)];
    [self.view addSubview:btn7];
    
    //8
    UIButton *btn8=[[UIButton alloc]initWithFrame:CGRectMake(280, 155, 26,26)];
    [btn8 setImage:[UIImage imageNamed:@"首页_18@2x"] forState:UIControlStateNormal];
    [btn8 setTitle:@"更多" forState:UIControlStateNormal];
    [btn8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置缩进
    //上 左  下 右
    [btn8 setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
    [btn8 setTitleEdgeInsets:UIEdgeInsetsMake(0, -80, -44, -105)];
    [self.view addSubview:btn8];
    
}
#pragma mark - UI
-(void)settingNavi
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"256"] forBarMetrics:UIBarMetricsDefault];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"首页_03@2x"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    //设置左侧的按钮
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    leftBtn.backgroundColor = [UIColor clearColor];
    
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [leftBtn setTitle:@"北京" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"首页_06@2x"] forState:UIControlStateNormal];
    [leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
    UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    //[leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
        //    UIImage *image =[UIImage imageNamed:@"首页0_03"];
    //    UIImageView *iv = [[UIImageView alloc]initWithImage:image];
    //
    //    //放到中间的
    //    UIBarButtonItem *itemTitleV = [[UIBarButtonItem alloc]initWithCustomView:iv];
    
    self.navigationItem.leftBarButtonItems = @[leftItem1];
    
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //从队列中去取得可复用的Cell  此方法写过之后 一定可以获得Cell
    MYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //设置cell的内容
    [cell setImageHeader:_dataSource[indexPath.row] andLabelText:_dataSource[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark-searchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}
//已经开始输入之后 会调用的方法
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //显示取消按钮
    searchBar.showsCancelButton =YES;
    
    NSLog(@"开始输入了");
}
//能够结束输入
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}
//结束编辑
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"结束编辑");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readData];
    [self createUI];
    [self settingNavi];
    [self showPhoto];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
