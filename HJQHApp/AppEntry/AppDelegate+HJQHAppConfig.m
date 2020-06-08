//
//  AppDelegate+HJQHAppConfig.m
//  HJQHApp
//
//  Created by xjg on 2020/5/25.
//  Copyright © 2020 rui cong. All rights reserved.
//

#import "AppDelegate+HJQHAppConfig.h"

@implementation AppDelegate (HJQHAppConfig)
-(void)HJQHConfigVC{
    
    [[UITabBar appearance]setBackgroundImage:[UIImage HJQHImageWithColor:UIColor.whiteColor]];
    [[UITabBar appearance]setShadowImage:[UIImage HJQHImageWithColor:UIColor.clearColor]];
    
    [[UINavigationBar appearance]setBackgroundImage:[UIImage HJQHImageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage HJQHImageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary * selectDic = [NSMutableDictionary dictionary];
    selectDic[NSForegroundColorAttributeName] = HJQHThemeColor;
    
    NSMutableDictionary * normalDic = [NSMutableDictionary dictionary];
    normalDic[NSForegroundColorAttributeName] = HJQHNormalTabbar;
    [[UITabBarItem appearance] setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    

}
@end
