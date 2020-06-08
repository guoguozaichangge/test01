//
//  UIImage+HJQHImageWithColor.m
//  HJQHApp
//
//  Created by xjg on 2020/5/25.
//  Copyright © 2020 rui cong. All rights reserved.
//

#import "UIImage+HJQHImageWithColor.h"

@implementation UIImage (HJQHImageWithColor)
+ (UIImage *)HJQHImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
