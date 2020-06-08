//
//  HJQHHomeNewsModel.h
//  HJQHApp
//
//  Created by xjg on 2020/5/27.
//  Copyright © 2020 rui cong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJQHHomeNewsModel : NSObject

@property (nonatomic,assign) NSInteger tid;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * desc;
@property (nonatomic,strong) NSString * post_date;
@property (nonatomic,strong) NSString * thumb;

@end

NS_ASSUME_NONNULL_END
