//
//  LoginViewController.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"

@interface LoginViewController()

@property (nonatomic, weak) IBOutlet UITextField *userNameTf;
@property (nonatomic, weak) IBOutlet UITextField *passwordTf;
@property (nonatomic, strong) LoginViewModel *loginViewModel;

- (IBAction)loginAction:(id)sender;

@end

@implementation LoginViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - 

- (LoginViewModel *)loginViewModel
{
    dispatch_once_t once;
    dispatch_once(&once, ^{
        _loginViewModel = [[LoginViewModel alloc] init];
    });
    return _loginViewModel;
}

#pragma mark - Action

- (IBAction)loginAction:(id)sender
{
    self.loginViewModel.username = self.userNameTf.text;
    self.loginViewModel.password = self.passwordTf.text;
    if ([self.loginViewModel isValidUserName]) {
        [self.loginViewModel startLogin];
    }
}

#pragma mark -
- (void)finishLogin
{
    [self performSegueWithIdentifier:@"FinishLoginSegue" sender:nil];
}

@end
