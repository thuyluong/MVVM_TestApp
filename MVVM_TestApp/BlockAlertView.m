//
//  BlockAlertView.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/22/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "BlockAlertView.h"

@implementation BlockAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles,...
{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_clickButtonBlock) {
        _clickButtonBlock(buttonIndex);
    }
    else {
        NSAssert(NO , @"Should implement callback block");
    }
}

- (NSInteger)addButtonWithTitle:(NSString *)title handleBlock:(ClickButtonBlock)clickButtonBlock
{
    _clickButtonBlock = clickButtonBlock;
    return [super addButtonWithTitle:title];
}

@end
