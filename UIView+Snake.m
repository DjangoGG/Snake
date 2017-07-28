//
//  UIView+Snake.m
//  Learning
//
//  Created by 姜伦 on 17/7/21.
//  Copyright © 2017年 Infosys. All rights reserved.
//

#import "UIView+Snake.h"

@implementation UIView (Snake)

- (NSArray *)sn_makeConstraints:(void (^)(SNConstraintMaker *))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    SNConstraintMaker *constraintMaker = [[SNConstraintMaker alloc] initWithView:self];
    block(constraintMaker);
    return [constraintMaker install];
}

- (SNViewAttribute *)sn_left {
    return [[SNViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeft];
}

- (SNViewAttribute *)sn_right {
    return [[SNViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeRight];
}

- (SNViewAttribute *)sn_top {
    return [[SNViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTop];
}

- (SNViewAttribute *)sn_bottom {
    return [[SNViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottom];
}

- (SNViewAttribute *)sn_width {
    return [[SNViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeWidth];
}

- (SNViewAttribute *)sn_height {
    return [[SNViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeHeight];
}

- (SNViewAttribute *)sn_centerX {
    return [[SNViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterX];
}

- (SNViewAttribute *)sn_centerY {
    return [[SNViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterY];
}

@end
