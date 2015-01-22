//
//  BlockAlertView.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/22/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickButtonBlock)(NSInteger buttonIndex);

@interface BlockAlertView : UIAlertView <UIAlertViewDelegate>


@property (nonatomic, copy) ClickButtonBlock clickButtonBlock;


- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles,...;

- (NSInteger)addButtonWithTitle:(NSString *)title handleBlock:(ClickButtonBlock)clickButtonBlock;

@end
