//
//  AppDelegate.m
//  美团页面
//
//  Created by 千锋 on 16/6/17.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstPageViewController.h"
#import "FirstShowViewController.h"
#import "GroupViewController.h"
#import "MyViewController.h"
#import "SetViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor yellowColor];
    [self settingTabBarController];
    //3、设置window可见
    [self settingTabBar];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}
-(void)settingTabBarController{
    FirstShowViewController *firstVC=[[FirstShowViewController alloc]init];
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:firstVC];
    
    //如果单独设置tabbar上面的文字的时候
    firstVC.tabBarItem.title = @"首页";
    //设置  0一般代表ViewController
    //self.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    //设置图片 连文字一起设置了
    //第一个参数 是文字
    //第二个参数 是正常状态下的图片
    //第三个参数 是选中状态下的图片
    UIImage *selectIm = [UIImage imageNamed:@"首页_35@2x"];
    UIImage *imageO = [selectIm imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置tabBarItem
    firstVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"设置_16@2x"] selectedImage:imageO];
    
    //第二个界面
    GroupViewController *secondVC = [[GroupViewController alloc]init];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:secondVC];
    
    secondVC.title = @"团购";
    //如果单独设置tabbar上面的文字的时候
    secondVC.tabBarItem.title = @"首页";
    //设置  0一般代表ViewController
    //self.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    //设置图片 连文字一起设置了
    //第一个参数 是文字
    //第二个参数 是正常状态下的图片
    //第三个参数 是选中状态下的图片
    UIImage *selectImg = [UIImage imageNamed:@"团购_全部分类_美食_47@2x"];
    UIImage *imageO1 = [selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置tabBarItem
    secondVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"团购" image:[UIImage imageNamed:@"设置_18@2x"] selectedImage:imageO1];
    
    //第三个界面
    MyViewController *thirdVC =[[MyViewController alloc]init];
    thirdVC.title=@"我的";
    UINavigationController * nav3=[[UINavigationController alloc]initWithRootViewController:thirdVC];
    
    thirdVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"设置_11@2x"] selectedImage:[[UIImage imageNamed:@"设置_11@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //第四个界面
    SetViewController *forthVC =[[SetViewController alloc]init];
    forthVC.title=@"设置";
    forthVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"设置" image:[UIImage imageNamed:@"首页_03@2x"] selectedImage:[[UIImage imageNamed:@"首页_03@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *nav4=[[UINavigationController  alloc]initWithRootViewController:forthVC];
    
    //套一个tabBarController
    //创建tabBarController
    UITabBarController *tabC = [[UITabBarController alloc]init];
    //套到VCs上面去
    tabC.viewControllers = @[nav,nav2,nav3,nav4];
    
    //设置tabBarController成为根视图控制器
    self.window.rootViewController = tabC;
}
//定制tabBar 标签条
-(void)settingTabBar
{
    //获得tabbar
    UITabBarController *tabC =(UITabBarController *)  self.window.rootViewController;
    //定制样式 枚举
    tabC.tabBar.barStyle = UIBarStyleDefault;
    //定制背景图
    [tabC.tabBar setBackgroundImage:[UIImage imageNamed:@"256"]];
    //定制透明度
    tabC.tabBar.translucent = YES;
    //设定背景色
    [tabC.tabBar setBackgroundColor:[UIColor orangeColor]];
    //设置点击的阴影图
    tabC.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"tabbar_rank_press"];
    
    

    // Override point for customization after application launch.
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
