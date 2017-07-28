//
//  UIView+Snake.h
//  Learning
//
//  Created by 姜伦 on 17/7/21.
//  Copyright © 2017年 Infosys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNConstraintMaker.h"
#import "SNViewAttribute.h"

@interface UIView (Snake)

@property (nonatomic, strong, readonly) SNViewAttribute *sn_left;
@property (nonatomic, strong, readonly) SNViewAttribute *sn_top;
@property (nonatomic, strong, readonly) SNViewAttribute *sn_right;
@property (nonatomic, strong, readonly) SNViewAttribute *sn_bottom;
@property (nonatomic, strong, readonly) SNViewAttribute *sn_width;
@property (nonatomic, strong, readonly) SNViewAttribute *sn_height;
@property (nonatomic, strong, readonly) SNViewAttribute *sn_centerX;
@property (nonatomic, strong, readonly) SNViewAttribute *sn_centerY;

- (NSArray *)sn_makeConstraints:(void(NS_NOESCAPE ^)(SNConstraintMaker *make))block;

@end
