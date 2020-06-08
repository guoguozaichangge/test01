//
//  HJQHHomeVC.m
//  HJQHApp
//
//  Created by xjg on 2020/5/25.
//  Copyright © 2020 rui cong. All rights reserved.
//

#import "HJQHHomeVC.h"
#import "HJQHMainFirstTC.h"
#import "HJQHHomeNewsModel.h"

@interface HJQHHomeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * HJQHMainTableView;

@end

@implementation HJQHHomeVC

-(UITableView *)HJQHMainTableView{
    if (!_HJQHMainTableView) {
        _HJQHMainTableView = ({
            UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.backgroundColor = UIColor.whiteColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView;
        });
    }
    return _HJQHMainTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    [self.view addSubview:self.HJQHMainTableView];
    [self.HJQHMainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.HJQHMainTableView registerNib:[UINib nibWithNibName:@"HJQHMainFirstTC" bundle:nil] forCellReuseIdentifier:NSStringFromClass([HJQHMainFirstTC class])];
    [self HJQHDataRequest];
    [self.HJQHMainTableView registerNib:[UINib nibWithNibName:@"HJQHHomeFourthTC" bundle:nil] forCellReuseIdentifier:@"HJQHHomeFourthTC"];
    
}
-(void)HJQHDataRequest{
    NSURLSession * ZhaoBaiSession = [NSURLSession sharedSession];
    NSMutableURLRequest * ZhaoBaiUrlReq = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.tzch6.com/Index/NnewsListA"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    ZhaoBaiUrlReq.HTTPMethod = @"POST";
    NSDictionary * dict = @{@"p":@"1"};
  NSData * data =  [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingFragmentsAllowed error:nil];
    ZhaoBaiUrlReq.HTTPBody = data;
    [ZhaoBaiUrlReq setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"content-type"];
    NSURLSessionDataTask *  ZhaoBaiDataTask =  [ZhaoBaiSession dataTaskWithRequest:ZhaoBaiUrlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        [self.ZhaoBaiTableView.mj_header endRefreshing];
//        [self.ZhaoBaiTableView.mj_footer endRefreshing];
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSDictionary *  ZhaoBaiDict =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                NSArray * tempArray = ZhaoBaiDict[@"data"];
                for (NSDictionary * dict in tempArray) {
                    HJQHHomeNewsModel * model = [[HJQHHomeNewsModel alloc]init];
                    [model setValuesForKeysWithDictionary:dict];
                    
//                    [self.ZhaoBaiHeaderArray addObject:model];
//                    [self.ZhaoBaiTableView reloadData];
                }
                
            });
        }else{
//            [self.ZhaoBaiTableView.mj_header endRefreshing];
//            [self.ZhaoBaiTableView.mj_footer endRefreshing];
        }
    }];
    [ZhaoBaiDataTask resume];
}
#pragma mark __组数___
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
#pragma mark __返回每组中的行数___
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
#pragma mark __行高___
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 180;
    }else if (indexPath.section == 1){
        return 120;
    }
    return 180;
}
#pragma mark __cell___
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        HJQHMainFirstTC * HJQHFirstTC = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HJQHMainFirstTC class]) forIndexPath:indexPath];
        HJQHFirstTC.selectionStyle = UITableViewCellSelectionStyleNone;
        return HJQHFirstTC;
    }else{
        HJQHHomeFourthTC * HJQHFourthTC = [tableView dequeueReusableCellWithIdentifier:@"HJQHHomeFourthTC" forIndexPath:indexPath];
        
        HJQHFourthTC.buttonBlock = ^(UIButton * button){
            if (button.tag == 1000) {
                HJQHHomeNewsVC * HJQHNewsVC = [[HJQHHomeNewsVC alloc]init];
                [self.navigationController pushViewController:HJQHNewsVC animated:NO];
            }
        };
        
        return HJQHFourthTC;
    }
    
}

#pragma mark __每组中footer的高度___
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
    
}
#pragma mark __每组中header的高度___
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
#pragma mark __每组中footer的view___
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
#pragma mark __每组中header的view___
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
#pragma mark __cell的点击事件___
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        HJQHHomeNewsVC * HJQHNewsVC = [[HJQHHomeNewsVC alloc]init];
        [self.navigationController pushViewController:HJQHNewsVC animated:NO];
    }
}


@end
