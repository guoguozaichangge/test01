//
//  HJQHMainFirstTC.m
//  HJQHApp
//
//  Created by xjg on 2020/5/25.
//  Copyright © 2020 rui cong. All rights reserved.
//

#import "HJQHMainFirstTC.h"

@interface HJQHMainFirstTC ()
@property (weak, nonatomic) IBOutlet XRCarouselView *HJQHCycleView;

@end
@implementation HJQHMainFirstTC

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.HJQHCycleView.imageArray = @[[UIImage imageNamed:@"HJQH_FirstCell01"],[UIImage imageNamed:@"HJQH_FirstCell02"]];
    self.HJQHCycleView.changeMode = ChangeModeFade;
    self.HJQHCycleView.time = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
