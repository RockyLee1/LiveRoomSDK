//
//  LoginViewController.m
//  BBLiveDemo
//
//  Created by linzuhan on 2018/5/16.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRequest.h"
#import "UserModel.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginBtnClicked:(UIButton *)sender
{
    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    LoginRequest *request = [[LoginRequest alloc] init];
    request.userName = userName;
    request.password = password;
    
    [request startRequestWithCompleteBlockWithSuccess:^(__kindof BBLiveBaseRequest *request) {
        
        
    } failure:^(__kindof BBLiveBaseRequest *request) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
