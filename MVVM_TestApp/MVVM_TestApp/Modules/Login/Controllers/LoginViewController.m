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
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _loginViewModel = [[LoginViewModel alloc] initWithLoginViewController:self];
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
    UINavigationController *navigationController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"NavigationControllerID"];
    self.view.window.rootViewController = navigationController;
}

@end
