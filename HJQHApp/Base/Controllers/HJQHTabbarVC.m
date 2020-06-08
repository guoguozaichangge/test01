//
//  HJQHTabbarVC.m
//  HJQHApp
//
//  Created by xjg on 2020/5/25.
//  Copyright © 2020 rui cong. All rights reserved.
//

#import "HJQHTabbarVC.h"
@interface HJQHTabbarVC ()
@property (nonatomic,strong) NSArray * HJQHTabbarItemsArr;
@property (nonatomic,strong) NSArray * HJQHTTabbarItemImageArr;
@property (nonatomic,strong) NSArray * HJQHTTabbarItemSelectImageArr;
@property (nonatomic,strong) NSArray * HJQHTTabbarVCArr;
@end

@implementation HJQHTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.HJQHTabbarItemsArr = @[@"首页",@"行情",@"论坛",@"我的"];
    self.HJQHTTabbarItemImageArr = @[@"HJQH_HomeNotSelect",@"HJQH_SecondNotSelect",@"HJQH_ThirdNotSelect",@"HJQH_MyNotSelect"];
    self.HJQHTTabbarItemSelectImageArr = @[@"HJQH_HomeSelect",@"HJQH_SecondSelect",@"HJQH_ThirdSelect",@"HJQH_MySelect"];
    self.HJQHTTabbarVCArr = @[@"HJQHHomeVC",@"HJQHTendencyVC",@"HJQHCommunityVC",@"HJQHMyVC"];

    [self HJQHAddTabbarVC];
}
-(void)HJQHAddTabbarVC{
    NSMutableArray * HJQHTempArr = [NSMutableArray array];
    NSMutableArray * HJQHTempVCArr = [NSMutableArray array];
    for (int i = 0; i<self.HJQHTabbarItemsArr.count; i++) {
        
        NSMutableDictionary *  dict = [NSMutableDictionary dictionary];
        [dict setObject:self.HJQHTabbarItemsArr[i] forKey:CYLTabBarItemTitle];
        [dict setObject:self.HJQHTTabbarItemImageArr[i] forKey:CYLTabBarItemImage];
        [dict setObject:self.HJQHTTabbarItemSelectImageArr[i] forKey:CYLTabBarItemSelectedImage];
        [HJQHTempArr addObject:dict];
        self.tabBarItemsAttributes = HJQHTempArr;
        
        HJQHNavigationVC * nav = [[HJQHNavigationVC alloc]initWithRootViewController:[[NSClassFromString(self.HJQHTTabbarVCArr[i]) alloc]init]];
        [HJQHTempVCArr addObject:nav];
        self.viewControllers = HJQHTempVCArr;
    }
}

@end
