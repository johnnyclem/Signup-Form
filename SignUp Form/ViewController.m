//
//  ViewController.m
//  SignUp Form
//
//  Created by John Clem on 5/6/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirmTextField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChangeTextWithNotification:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// listen for keyboard event
// make sure it's a valid email address
// password and password confirmation should match
// password strength checker / valid password

- (void)textFieldDidChangeTextWithNotification:(NSNotification *)note
{
    self.signUpButton.enabled = [self passwordsMatch];
}

- (BOOL)passwordsMatch
{
    return ([self.passwordTextField.text isEqualToString:self.passwordConfirmTextField.text]);
}

- (IBAction)signUp:(id)sender
{
    if(![self.passwordTextField.text isEqualToString:self.passwordConfirmTextField.text]) {
        NSLog(@"Form invalid: Passwords do not match");
    }
}

@end
