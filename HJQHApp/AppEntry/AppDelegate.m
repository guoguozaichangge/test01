//
//  AppDelegate.m
//  HJQHApp
//
//  Created by xjg on 2020/5/25.
//  Copyright © 2020 rui cong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HJQHTabbarVC.h"
#import "AppDelegate+HJQHAppConfig.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[HJQHTabbarVC alloc]init];
    [self.window makeKeyAndVisible];
    [self HJQHConfigVC];
    
    return YES;
}




@end
