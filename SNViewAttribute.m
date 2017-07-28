//
//  SNViewAttribute.m
//  Learning
//
//  Created by 姜伦 on 17/7/21.
//  Copyright © 2017年 Infosys. All rights reserved.
//

#import "SNViewAttribute.h"

@implementation SNViewAttribute

- (id)initWithView:(UIView *)view layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    self = [super init];
    if (!self) return nil;
    
    _view = view;
    _layoutAttribute = layoutAttribute;
    
    return self;
}

@end
