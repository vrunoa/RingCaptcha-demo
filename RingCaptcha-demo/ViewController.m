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
    [Ringcaptcha verifyOnboardWithAppKey:@"API_KEY" andSecretKey:@"SECRET_KEY" inViewController:self delegate:nil success:^(RingcaptchaVerification *verification) {
        NSLog(@"Verification process ended successfully? %@", verification.verificationId);
        NSLog(@"Verification process ended successfully? %d", verification.verificationSuccessful);
        NSLog(@"Verification process ended successfully? %@", verification.phoneNumber);
        NSLog(@"Verification process ended successfully? %@", verification.errorDescription);
    } cancel:^(RingcaptchaVerification *verification) {
        NSLog(@"Verification process cancelled? %d", verification.verificationSuccessful);
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
