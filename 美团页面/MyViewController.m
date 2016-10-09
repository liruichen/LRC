//
//  MyViewController.m
//  美团
//
//  Created by 千锋 on 16/6/17.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "MyViewController.h"
#import "MYYYTableViewCell.h"
#import "MyModel.h"
#import "MyAccountViewController.h"

#define ARRAY @[@"我的订单", @"我的团购券", @"我的钱包", @"我的收藏", @"我的足迹", @"会员", @"每日推荐"]

@interface MyViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_dataSource;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MyViewController
#pragma mark - DataSource
- (void) readData {
    _dataSource = [[NSMutableArray alloc]init];
    for (int i = 0; i < 7; i++) {
        MyModel *myModel = [[MyModel alloc]initWithImageName:[NSString stringWithFormat:@"%@@2x", ARRAY[i]] andTitle:ARRAY[i] andNumber:@"0"];
        [_dataSource addObject:myModel];
    }
}

#pragma mark - TableView
- (void) createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:220 / 255.0 green:222 / 255.0 blue:223 / 255.0 alpha:1];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self createTableHeaderView];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - TableHeaderView
- (void) createTableHeaderView {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizerWasPress:)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    imageView.image = [UIImage imageNamed:@"我的－登录_02@2x"];
    
    imageView.userInteractionEnabled = YES;
    
    self.tableView.tableHeaderView = imageView;
    
    [self.tableView.tableHeaderView addGestureRecognizer:tapGestureRecognizer];
    //
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(340, 40, 30, 30)];
    [btn setImage:[UIImage imageNamed:@"我的－登录_12@2x"] forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:btn];
}

#pragma mark - lifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readData];
    
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        case 1:
            return 3;
        case 2:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MYYYTableViewCell*cell = [[MYYYTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizerWasPress:)];
    
    switch ([indexPath section]) {
        case 0: {
            [cell setContent:[_dataSource objectAtIndex: indexPath.row]];
        }
            break;
        case 1: {
            [cell setContent:[_dataSource objectAtIndex: indexPath.row + 3]];
            if (5 == indexPath.row + 3) {
                cell.numberLabel.text = @"积分：0";
            }
        }
            break;
        case 2: {
            [cell setContent:[_dataSource objectAtIndex: indexPath.row + 6]];
            [cell.numberLabel removeFromSuperview];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 10, 12.5, 35, 20)];
            imageView.image = [UIImage imageNamed:@"每日推荐_后@2x"];
            [cell addSubview:imageView];
            
            
        }
            break;
        default:
            break;
    }
    [cell addGestureRecognizer:tapGestureRecognizer];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    switch (section) {
        case 0:
        case 1:
            return 10;
        case 2:
            return 0.1;
            break;
        default:
            break;
    }
    return 0;
}

#pragma mark - action
- (void) tapGestureRecognizerWasPress: (UITapGestureRecognizer *) tapGestureRecognizer {
    NSLog(@"点击");
}
-(void)btnClick:(UIButton *)btn{
    MyAccountViewController * av=[[MyAccountViewController alloc]init];
    [self.navigationController pushViewController:av animated:YES];
}
@end
