//
//  SNConstraint.h
//  Learning
//
//  Created by 姜伦 on 17/7/21.
//  Copyright © 2017年 Infosys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNViewAttribute.h"

@interface SNConstraint : NSObject

- (SNConstraint * (^)(id attr))equalTo;
- (SNConstraint *)with;
- (SNConstraint * (^)(CGFloat))offset;

- (instancetype)initWithFirstViewAttribute:(SNViewAttribute *)firstViewAttribute;
- (void)install;

@end
