//
//  SetViewController.m
//  大众点评
//
//  Created by 千锋 on 16/6/16.
//

#import "SetViewController.h"

#define ARRAY @[@"省流量模式", @"消息提醒", @"图片设置", @"清空缓存", @"意见反馈", @"检查更新", @"关于"]

@interface SetViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SetViewController
#pragma mark - TableView
- (void) createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:220 / 255.0 green:222 / 255.0 blue:223 / 255.0 alpha:1];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - lifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
        case 2:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 45)];
    label.font = [UIFont systemFontOfSize:15];

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizerWasPress:)];
    
    switch ([indexPath section]) {
        case 0: {
            label.text = ARRAY [indexPath.row];
            UISwitch *switchView = [[UISwitch alloc]initWithFrame:CGRectMake(315, cell.center.y - 13.5, 0, 0)];
            
            switchView.transform = CGAffineTransformMakeScale(0.75, 0.75);

            [switchView addTarget:nil action:nil forControlEvents:UIControlEventValueChanged];
            
            [cell.contentView addSubview:switchView];
        }
            break;
        case 1: {
            label.text = ARRAY [indexPath.row + 1];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            [cell addGestureRecognizer:tapGestureRecognizer];
        }
            break;
        case 2: {
            label.text = ARRAY [indexPath.row + 4];
            if (5 == indexPath.row + 4) {
                UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(265, 0, 100, 45)];
                textLabel.font = [UIFont systemFontOfSize:10];
                textLabel.text = @"当前版本：v4.9.2";
                [cell.contentView addSubview:textLabel];
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            [cell addGestureRecognizer:tapGestureRecognizer];
        }
            break;
        default:
            break;
    }
    [cell.contentView addSubview:label];
    
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

@end
