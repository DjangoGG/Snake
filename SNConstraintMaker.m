//
//  SNConstraintMaker.m
//  Learning
//
//  Created by 姜伦 on 17/7/21.
//  Copyright © 2017年 Infosys. All rights reserved.
//

#import "SNConstraintMaker.h"

@interface SNConstraintMaker ()
@property (nonatomic, weak) UIView *view;
@property (nonatomic, strong) NSMutableArray *constraints;
@end

@implementation SNConstraintMaker

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (!self) return nil;
    
    _view = view;
    _constraints = [NSMutableArray new];
    
    return self;
}

- (NSArray *)install {
    NSArray *constraints = self.constraints.copy;
    for (SNConstraint *constraint in constraints) {
        [constraint install];
    }
    [self.constraints removeAllObjects];
    return constraints;
}

- (SNConstraint *)addConstraintWithLayoutAttribute: (NSLayoutAttribute)layoutAttribute {
    SNViewAttribute *firstViewAttribute = [[SNViewAttribute alloc] initWithView:self.view layoutAttribute:layoutAttribute];
    SNConstraint *newConstraint = [[SNConstraint alloc] initWithFirstViewAttribute:firstViewAttribute];
    [self.constraints addObject:newConstraint];
    return newConstraint;
}

- (SNConstraint *)left {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeft];
}

- (SNConstraint *)right {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeRight];
}

- (SNConstraint *)top {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTop];
}

- (SNConstraint *)bottom {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBottom];
}

- (SNConstraint *)height {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeHeight];
}

- (SNConstraint *)width {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeWidth];
}

- (SNConstraint *)centerX {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterX];
}

- (SNConstraint *)centerY {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterY];
}

@end
