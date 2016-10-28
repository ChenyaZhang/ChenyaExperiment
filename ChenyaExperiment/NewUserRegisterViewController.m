//
//  NewUserRegisterViewController.m
//  ChenyaExperiment
//
//  Created by Chenya Zhang on 10/28/16.
//  Copyright © 2016 Chenya Zhang. All rights reserved.
//

#import "NewUserRegisterViewController.h"

@interface NewUserRegisterViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *healthTapUIImage;
@property (strong, nonatomic) IBOutlet UILabel *instructionUILabel;
@property (strong, nonatomic) IBOutlet UITextField *emailUITextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordUITextField;
@property (strong, nonatomic) IBOutlet UITextView *agreementUITextView;
@property (strong, nonatomic) IBOutlet UITextView *memberUITextView;
@property (strong, nonatomic) IBOutlet UITextView *doctorUITextView;
@end

@implementation NewUserRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UILabel-Instruction
    // Need a whole sentence for better translation
    NSMutableAttributedString *instructionNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Create a free, private account or login", nil) attributes:@{
                                                                                                                                                                         NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:18.5]}];
    // Get the special string according to its translation
    NSString *freeNSString = NSLocalizedString(@"free", nil);
    NSString *privateNSString = NSLocalizedString(@"private", nil);
    // Get its range
    NSRange rangeOfFreeNSString = [[instructionNSMutableAttributedString string] rangeOfString:freeNSString];
    NSRange rangeOfPrivateNSString = [[instructionNSMutableAttributedString string] rangeOfString:privateNSString];
    [instructionNSMutableAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir-Heavy" size:18.5] range:rangeOfFreeNSString];
    [instructionNSMutableAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir-Heavy" size:18.5] range:rangeOfPrivateNSString];
    self.instructionUILabel.attributedText = instructionNSMutableAttributedString;
    [self.instructionUILabel sizeToFit];
    
    // UITextField-Email
    NSMutableAttributedString *emailNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Your email ", nil) attributes:@{
                                                                                                                                                                           NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:18.5]}];
    self.emailUITextField.placeholder = [emailNSMutableAttributedString string];
    self.emailUITextField.textAlignment = NSTextAlignmentCenter;
    
    // UITextField-Password
    NSMutableAttributedString *passwordNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Password(6+ characters) ", nil) attributes:@{
                                                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:18.5]}];
    self.passwordUITextField.placeholder = [passwordNSMutableAttributedString string];
    self.passwordUITextField.textAlignment = NSTextAlignmentCenter;
    
    // UITextView-Agreement
    // Only UITextView supports open URL
    NSMutableAttributedString *agreementNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"You agree to our Terms and Privacy Policy", nil) attributes:@{
                                                                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSString *termsNSString = NSLocalizedString(@"Terms", nil);
    NSString *privacyPolicyNSString = NSLocalizedString(@"Privacy Policy", nil);
    NSRange rangeOfTermsNSString = [[agreementNSMutableAttributedString string] rangeOfString:termsNSString];
    NSRange rangeOfPrivacyPolicyNSString = [[agreementNSMutableAttributedString string] rangeOfString:privacyPolicyNSString];
    NSDictionary *termsAttributesDictionary = @{
                                                NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    NSDictionary *privacyPolicyAttributesDictionary = @{
                                                       NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [agreementNSMutableAttributedString setAttributes:termsAttributesDictionary range:rangeOfTermsNSString];
    [agreementNSMutableAttributedString setAttributes:privacyPolicyAttributesDictionary range:rangeOfPrivacyPolicyNSString];
    self.agreementUITextView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]};
    self.agreementUITextView.attributedText = agreementNSMutableAttributedString;
    [self.agreementUITextView sizeToFit];
    self.agreementUITextView.textAlignment = NSTextAlignmentCenter;
    self.agreementUITextView.editable = NO;
    
    // UITextView-Member
    NSMutableAttributedString *memberNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Are you a member? Login >", nil) attributes:@{
                                                                                                                                                                           NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSString *loginNSString = NSLocalizedString(@"Login >", nil);
    NSRange rangeOfLoginNSString = [[memberNSMutableAttributedString string] rangeOfString:loginNSString];
    NSDictionary *loginAttributesDictionary = @{
                                                        NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [memberNSMutableAttributedString setAttributes:loginAttributesDictionary range:rangeOfLoginNSString];
    self.memberUITextView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]};
    self.memberUITextView.attributedText = memberNSMutableAttributedString;
    [self.memberUITextView sizeToFit];
    self.memberUITextView.textAlignment = NSTextAlignmentCenter;
    self.memberUITextView.editable = NO;
    
    // UITextView-Doctor
    NSMutableAttributedString *doctorNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Are you a doctor? Try our doctor app >", nil) attributes:@{
                                                                                                                                                                                     NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSString *doctorAppNSString = NSLocalizedString(@"Try our doctor app >", nil);
    NSRange rangeOfDoctorAppNSString = [[doctorNSMutableAttributedString string] rangeOfString:doctorAppNSString];
    NSDictionary *doctorAppAttributesDictionary = @{
                                                NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [doctorNSMutableAttributedString setAttributes:doctorAppAttributesDictionary range:rangeOfDoctorAppNSString];
    self.doctorUITextView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]};
    self.doctorUITextView.attributedText = doctorNSMutableAttributedString;
    [self.doctorUITextView sizeToFit];
    self.doctorUITextView.textAlignment = NSTextAlignmentCenter;
    self.doctorUITextView.editable = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
