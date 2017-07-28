//
//  SNConstraint.m
//  Learning
//
//  Created by 姜伦 on 17/7/21.
//  Copyright © 2017年 Infosys. All rights reserved.
//

#import "SNConstraint.h"
#import "SNViewAttribute.h"

@interface SNConstraint ()
@property (nonatomic, weak) UIView *installedView;
@property (nonatomic, strong) SNViewAttribute *firstViewAttribute;
@property (nonatomic, strong) SNViewAttribute *secondViewAttribute;
@property (nonatomic, assign) NSLayoutRelation layoutRelation;
@property (nonatomic, assign) CGFloat layoutConstant;
@end

@implementation SNConstraint

- (instancetype)initWithFirstViewAttribute:(SNViewAttribute *)firstViewAttribute {
    self = [super init];
    if (!self) return nil;
    
    _firstViewAttribute = firstViewAttribute;
    
    return self;
}

- (void)install {
    UIView *firstItem = self.firstViewAttribute.view;
    NSLayoutAttribute firstLayoutAttribute = self.firstViewAttribute.layoutAttribute;
    UIView *secondItem;
    NSLayoutAttribute secondLayoutAttribute;
    
    if ((firstLayoutAttribute == NSLayoutAttributeWidth || firstLayoutAttribute == NSLayoutAttributeHeight) && !self.secondViewAttribute) {
        secondItem = nil;
        secondLayoutAttribute = NSLayoutAttributeNotAnAttribute;
        _installedView = firstItem;
    } else {
        secondItem = self.secondViewAttribute.view;
        secondLayoutAttribute = self.secondViewAttribute.layoutAttribute;
        
        UIView *closestCommonSuperview = [self findClosestSuperview:firstItem and:secondItem];
        NSAssert(closestCommonSuperview,
                 @"couldn't find a common superview for %@ and %@",
                 self.firstViewAttribute.view, self.secondViewAttribute.view);
        _installedView = closestCommonSuperview;
    }
    
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:firstItem
                                                                        attribute:firstLayoutAttribute
                                                                        relatedBy:_layoutRelation
                                                                           toItem:secondItem
                                                                        attribute:secondLayoutAttribute
                                                                       multiplier:1.0
                                                                         constant:_layoutConstant];
    [_installedView addConstraint:layoutConstraint];
}

- (SNConstraint *(^)(id))equalTo {
    return ^id(id someting) {
        return [self equalToSometing:someting];
    };
}

- (SNConstraint *)with {
    return self;
}

- (SNConstraint *(^)(CGFloat))offset {
    return ^id(CGFloat offset){
        self.offset = offset;
        return self;
    };
}

- (SNConstraint *)equalToSometing:(id)someting {
    self.layoutRelation = NSLayoutRelationEqual;
    
    if ([someting isKindOfClass:NSValue.class]) {
        // ...
        self.offset = [(NSNumber *)someting doubleValue];
    } else if ([someting isKindOfClass:UIView.class]) {
        _secondViewAttribute = [[SNViewAttribute alloc] initWithView:someting layoutAttribute:self.firstViewAttribute.layoutAttribute];
    } else if ([someting isKindOfClass:SNViewAttribute.class]) {
        _secondViewAttribute = someting;
    } else {
        NSAssert(NO, @"attempting to add unsupported attribute: %@", someting);
    }
    
    return self;
}

- (void)setOffset:(CGFloat)offset {
    self.layoutConstant = offset;
}

- (UIView *)findClosestSuperview:(UIView *)firstView and:(UIView *)secondView {
    UIView *closestCommonSuperview = nil;
    
    UIView *secondViewSuperview = secondView;
    while (!closestCommonSuperview && secondViewSuperview) {
        UIView *firstViewSuperview = firstView;
        while (!closestCommonSuperview && firstViewSuperview) {
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;
    }
    return closestCommonSuperview;
}

@end
