//
//  ViewController.m
//  RingCaptcha-demo
//
//  Created by Himanshu on 6/15/15.
//  Copyright (c) 2015 The HP Apps. All rights reserved.
//

#import "ViewController.h"
#import <Ringcaptcha/Ringcaptcha.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showRingcaptchaBtnAction:(id)sender {
    [Ringcaptcha verifyOnboardWithAppKey:@"API_KEY" andSecretKey:@"SECRET_KEY" inViewController:self delegate:self success: ^(RingcaptchaVerification *verification) {
        NSLog(@"Successful onboarding");
    } cancel:^(RingcaptchaVerification *verification) {
        NSLog(@"Onboarding cancelled");
    }];
}

#pragma mark - RingcaptchaDelegate
- (void)didFinishPhoneNumberVerification: (RingcaptchaVerification*) verification {
    NSLog(@"didFinishPhoneNumberVerification");
    NSLog(@"phoneNumber -> %@", verification.phoneNumber);
}
- (void) didFinishPhoneNumberVerificationWithCancel: (RingcaptchaVerification*) verification {
    NSLog(@"didFinishPhoneNumberVerificationWithCancel");
}

@end
