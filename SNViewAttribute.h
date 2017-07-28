//
//  SNViewAttribute.h
//  Learning
//
//  Created by 姜伦 on 17/7/21.
//  Copyright © 2017年 Infosys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SNViewAttribute : NSObject

@property (nonatomic, weak, readonly) UIView *view;
@property (nonatomic, assign, readonly) NSLayoutAttribute layoutAttribute;

- (id)initWithView:(UIView *)view layoutAttribute:(NSLayoutAttribute)layoutAttribute;

@end
