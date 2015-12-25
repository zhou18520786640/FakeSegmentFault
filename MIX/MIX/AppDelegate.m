//
//  AppDelegate.m
//  MIX
//
//  Created by zhou on 15/11/24.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "AppDelegate.h"
#import <RDVTabBarController/RDVTabBarController.h>
#import <RDVTabBarController/RDVTabBarItem.h>
#import "ZZQuestionViewController.h"
#import "ZZArticleViewController.h"
#import "ZZFindViewController.h"
#import "ZZSearchViewController.h"
#import "ZZMyHomeViewController.h"
#import "MacroDefinition.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "ZZHttpClient.h"



@interface AppDelegate ()
@property (nonatomic, strong) RDVTabBarController *viewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    ZZQuestionViewController *questionViewController = [[ZZQuestionViewController alloc] init];
    UINavigationController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:questionViewController];
    
    ZZArticleViewController *articleViewController = [[ZZArticleViewController alloc] init];
    UINavigationController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:articleViewController];
    
    ZZFindViewController  *findViewController = [[ZZFindViewController alloc] init];
    UINavigationController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:findViewController];
    
    
    ZZSearchViewController *searchViewController = [[ZZSearchViewController alloc] init];
    UINavigationController *fourthNavigationController = [[UINavigationController alloc]
                                                          initWithRootViewController:searchViewController];
    
    ZZMyHomeViewController *meViewController = [[ZZMyHomeViewController alloc] init];
    UINavigationController *fifthNavigationController = [[UINavigationController alloc]
                                                          initWithRootViewController:meViewController];
    

    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController, fourthNavigationController,fifthNavigationController]];
    self.viewController = tabBarController;
    self.window.rootViewController = tabBarController;
    
    
    
//    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
//    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"icon_tab_wenda", @"icon_tab_qa", @"icon_tab_discover", @"icon_tab_search",@"icon_tab_user"];
    NSArray *titles = @[@"问题",@"文章",@"发现",@"搜索",@"我的"];
    
    RDVTabBar *tabBar = [tabBarController tabBar];

    [tabBar setHeight:49];
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 63)];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
//        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        [item setBackgroundColor:UIColorFromRGB(0xf8f8f8)];
        UIImage *activedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_active",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        

        [item setFinishedSelectedImage:activedImage withFinishedUnselectedImage:unselectedimage];
        
        item.title = titles[index];
        item.itemHeight = 49;
        item.titlePositionAdjustment = UIOffsetMake(0, 3);
        item.selectedTitleAttributes = @{UITextAttributeTextColor:kMainColor};
        item.unselectedTitleAttributes = @{UITextAttributeTextColor:UIColorFromRGB(0x7F7F7F)};
        
        index++;
    }
    
    [self.window makeKeyAndVisible];
    
    
    
    UINavigationBar * appearance = [UINavigationBar appearance];
    [appearance setBarTintColor:kMainColor];
    
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;

    
    
    return YES;
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
