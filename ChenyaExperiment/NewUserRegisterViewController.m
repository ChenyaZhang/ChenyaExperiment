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
@property (strong, nonatomic) IBOutlet UITextView *userCountTextView;
@end

@implementation NewUserRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UILabel-Instruction
    // Need a whole sentence for better translation
    // Add the marker to the String directly and remove later
    NSMutableAttributedString *instructionNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Create a {start}free, private{end} account or login", nil) attributes:@{
                                                                                                                                                                         NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:18.5]}];
    // Get its range
    NSRange rangeOfStartNSString = [[instructionNSMutableAttributedString string] rangeOfString:@"{start}"];
    NSRange rangeOfEndNSString = [[instructionNSMutableAttributedString string] rangeOfString:@"{end}"];
    // Get the index position
    int startIndex = (int)(rangeOfStartNSString.location + rangeOfStartNSString.length);
    int endIndex = (int)rangeOfEndNSString.location;
    NSRange specialRange = NSMakeRange(startIndex, endIndex - startIndex);
    [instructionNSMutableAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir-Heavy" size:18.5] range:specialRange];
    // Remove markers with range. Be careful.
    [instructionNSMutableAttributedString deleteCharactersInRange:[[instructionNSMutableAttributedString string] rangeOfString:@"{start}"]];
    [instructionNSMutableAttributedString deleteCharactersInRange:[[instructionNSMutableAttributedString string] rangeOfString:@"{end}"]];
    self.instructionUILabel.attributedText = instructionNSMutableAttributedString;
    [self.instructionUILabel sizeToFit];
    
    // UITextField-Email
    NSMutableAttributedString *emailNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Your email ", @"Ask the user to enter his/her email") attributes:@{
                                                                                                                                                                           NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:18.5]}];
    self.emailUITextField.placeholder = [emailNSMutableAttributedString string];
    self.emailUITextField.textAlignment = NSTextAlignmentCenter;
    
    // UITextField-Password
    NSMutableAttributedString *passwordNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Password(6+ characters) ", @"Ask the user to enter his/her password") attributes:@{
                                                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:18.5]}];
    self.passwordUITextField.placeholder = [passwordNSMutableAttributedString string];
    self.passwordUITextField.textAlignment = NSTextAlignmentCenter;
    
    // UITextView-Agreement
    // Only UITextView supports open URL
    NSMutableAttributedString *agreementNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"You agree to our {start}Terms{end} and {start1}Privacy Policy{end1}", nil) attributes:@{
                                                                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    rangeOfStartNSString = [[agreementNSMutableAttributedString string] rangeOfString:@"{start}"];
    rangeOfEndNSString = [[agreementNSMutableAttributedString string] rangeOfString:@"{end}"];
    startIndex = (int)(rangeOfStartNSString.location + rangeOfStartNSString.length);
    endIndex = (int)rangeOfEndNSString.location;
    specialRange = NSMakeRange(startIndex, endIndex - startIndex);
    NSRange rangeOfStart1NSString = [[agreementNSMutableAttributedString string] rangeOfString:@"{start1}"];
    NSRange rangeOfEnd1NSString = [[agreementNSMutableAttributedString string] rangeOfString:@"{end1}"];
    int start1Index = (int)(rangeOfStart1NSString.location + rangeOfStart1NSString.length);
    int end1Index = (int)rangeOfEnd1NSString.location;
    NSRange specialRange1 = NSMakeRange(start1Index, end1Index - start1Index);
    NSDictionary *termsAttributesDictionary = @{
                                                NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    NSDictionary *privacyPolicyAttributesDictionary = @{
                                                       NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [agreementNSMutableAttributedString setAttributes:termsAttributesDictionary range:specialRange];
    [agreementNSMutableAttributedString setAttributes:privacyPolicyAttributesDictionary range:specialRange1];
    [agreementNSMutableAttributedString deleteCharactersInRange:[[agreementNSMutableAttributedString string] rangeOfString:@"{start}"]];
    [agreementNSMutableAttributedString deleteCharactersInRange:[[agreementNSMutableAttributedString string] rangeOfString:@"{end}"]];
    [agreementNSMutableAttributedString deleteCharactersInRange:[[agreementNSMutableAttributedString string] rangeOfString:@"{start1}"]];
    [agreementNSMutableAttributedString deleteCharactersInRange:[[agreementNSMutableAttributedString string] rangeOfString:@"{end1}"]];
    self.agreementUITextView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]};
    self.agreementUITextView.attributedText = agreementNSMutableAttributedString;
    [self.agreementUITextView sizeToFit];
    self.agreementUITextView.textAlignment = NSTextAlignmentCenter;
    self.agreementUITextView.editable = NO;
    
    // UITextView-User Count
    NSString *messageFormat = NSLocalizedString(@"Now %1$lu registered users in total", @"The parameter will be the current number of registered users.");
    NSMutableAttributedString *userCountNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:messageFormat attributes:@{
                                                                                                                                                                                                                                                                NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    self.userCountTextView.attributedText = userCountNSMutableAttributedString;
    [self.userCountTextView sizeToFit];
    self.userCountTextView.textAlignment = NSTextAlignmentCenter;
    self.userCountTextView.editable = NO;
    
    // UITextView-Member
    NSMutableAttributedString *memberNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Are you a member? {start}Login >{end}", @"Ask the user whether he/she has already registered on HealthTap") attributes:@{
                                                                                                                                                                           NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    rangeOfStartNSString = [[memberNSMutableAttributedString string] rangeOfString:@"{start}"];
    rangeOfEndNSString = [[memberNSMutableAttributedString string] rangeOfString:@"{end}"];
    startIndex = (int)(rangeOfStartNSString.location + rangeOfStartNSString.length);
    endIndex = (int)rangeOfEndNSString.location;
    specialRange = NSMakeRange(startIndex, endIndex - startIndex);
    NSDictionary *loginAttributesDictionary = @{
                                                        NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [memberNSMutableAttributedString setAttributes:loginAttributesDictionary range:specialRange];
    [memberNSMutableAttributedString deleteCharactersInRange:[[memberNSMutableAttributedString string] rangeOfString:@"{start}"]];
    [memberNSMutableAttributedString deleteCharactersInRange:[[memberNSMutableAttributedString string] rangeOfString:@"{end}"]];
    self.memberUITextView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]};
    self.memberUITextView.attributedText = memberNSMutableAttributedString;
    [self.memberUITextView sizeToFit];
    self.memberUITextView.textAlignment = NSTextAlignmentCenter;
    self.memberUITextView.editable = NO;
    
    // UITextView-Doctor
    NSMutableAttributedString *doctorNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Are you a doctor? {start}Try our doctor app >{end}", @"Ask the user whether he/she is not a patient but a doctor who should use another version of the app") attributes:@{
                                                                                                                                                                                     NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    rangeOfStartNSString = [[doctorNSMutableAttributedString string] rangeOfString:@"{start}"];
    rangeOfEndNSString = [[doctorNSMutableAttributedString string] rangeOfString:@"{end}"];
    startIndex = (int)(rangeOfStartNSString.location + rangeOfStartNSString.length);
    endIndex = (int)rangeOfEndNSString.location;
    specialRange = NSMakeRange(startIndex, endIndex - startIndex);
    NSDictionary *doctorAppAttributesDictionary = @{
                                                NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [doctorNSMutableAttributedString setAttributes:doctorAppAttributesDictionary range:specialRange];
    [doctorNSMutableAttributedString deleteCharactersInRange:[[doctorNSMutableAttributedString string] rangeOfString:@"{start}"]];
    [doctorNSMutableAttributedString deleteCharactersInRange:[[doctorNSMutableAttributedString string] rangeOfString:@"{end}"]];
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
