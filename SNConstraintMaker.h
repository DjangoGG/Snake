//
//  SNConstraintMaker.h
//  Learning
//
//  Created by 姜伦 on 17/7/21.
//  Copyright © 2017年 Infosys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNConstraint.h"

@interface SNConstraintMaker : NSObject

@property (nonatomic, strong, readonly) SNConstraint *left;
@property (nonatomic, strong, readonly) SNConstraint *top;
@property (nonatomic, strong, readonly) SNConstraint *right;
@property (nonatomic, strong, readonly) SNConstraint *bottom;
@property (nonatomic, strong, readonly) SNConstraint *width;
@property (nonatomic, strong, readonly) SNConstraint *height;
@property (nonatomic, strong, readonly) SNConstraint *centerX;
@property (nonatomic, strong, readonly) SNConstraint *centerY;

- (instancetype)initWithView:(UIView *)view;
- (NSArray *)install;

@end
