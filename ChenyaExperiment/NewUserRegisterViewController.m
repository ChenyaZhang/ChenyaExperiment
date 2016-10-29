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
    NSMutableAttributedString *agreementNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"You agree to our {start1}Terms{end1} and {start2}Privacy Policy{end2}", nil) attributes:@{
                                                                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSRange rangeOfStart1NSString = [[agreementNSMutableAttributedString string] rangeOfString:@"{start1}"];
    NSRange rangeOfEnd1NSString = [[agreementNSMutableAttributedString string] rangeOfString:@"{end1}"];
    int start1Index = (int)(rangeOfStart1NSString.location + rangeOfStart1NSString.length);
    int end1Index = (int)rangeOfEnd1NSString.location;
    NSRange specialRange1 = NSMakeRange(start1Index, end1Index - start1Index);
    NSRange rangeOfStart2NSString = [[agreementNSMutableAttributedString string] rangeOfString:@"{start2}"];
    NSRange rangeOfEnd2NSString = [[agreementNSMutableAttributedString string] rangeOfString:@"{end2}"];
    int start2Index = (int)(rangeOfStart2NSString.location + rangeOfStart2NSString.length);
    int end2Index = (int)rangeOfEnd2NSString.location;
    NSRange specialRange2 = NSMakeRange(start2Index, end2Index - start2Index);
    NSDictionary *termsAttributesDictionary = @{
                                                NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    NSDictionary *privacyPolicyAttributesDictionary = @{
                                                       NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [agreementNSMutableAttributedString setAttributes:termsAttributesDictionary range:specialRange1];
    [agreementNSMutableAttributedString setAttributes:privacyPolicyAttributesDictionary range:specialRange2];
    [agreementNSMutableAttributedString deleteCharactersInRange:[[agreementNSMutableAttributedString string] rangeOfString:@"{start1}"]];
    [agreementNSMutableAttributedString deleteCharactersInRange:[[agreementNSMutableAttributedString string] rangeOfString:@"{end1}"]];
    [agreementNSMutableAttributedString deleteCharactersInRange:[[agreementNSMutableAttributedString string] rangeOfString:@"{start2}"]];
    [agreementNSMutableAttributedString deleteCharactersInRange:[[agreementNSMutableAttributedString string] rangeOfString:@"{end2}"]];
    self.agreementUITextView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]};
    self.agreementUITextView.attributedText = agreementNSMutableAttributedString;
    [self.agreementUITextView sizeToFit];
    self.agreementUITextView.textAlignment = NSTextAlignmentCenter;
    self.agreementUITextView.editable = NO;
    
    // UITextView-Member
    NSMutableAttributedString *memberNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Are you a member? {start3}Login >{end3}", nil) attributes:@{
                                                                                                                                                                           NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSRange rangeOfStart3NSString = [[memberNSMutableAttributedString string] rangeOfString:@"{start3}"];
    NSRange rangeOfEnd3NSString = [[memberNSMutableAttributedString string] rangeOfString:@"{end3}"];
    int start3Index = (int)(rangeOfStart3NSString.location + rangeOfStart3NSString.length);
    int end3Index = (int)rangeOfEnd3NSString.location;
    NSRange specialRange3 = NSMakeRange(start3Index, end3Index - start3Index);
    NSDictionary *loginAttributesDictionary = @{
                                                        NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [memberNSMutableAttributedString setAttributes:loginAttributesDictionary range:specialRange3];
    [memberNSMutableAttributedString deleteCharactersInRange:[[memberNSMutableAttributedString string] rangeOfString:@"{start3}"]];
    [memberNSMutableAttributedString deleteCharactersInRange:[[memberNSMutableAttributedString string] rangeOfString:@"{end3}"]];
    self.memberUITextView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]};
    self.memberUITextView.attributedText = memberNSMutableAttributedString;
    [self.memberUITextView sizeToFit];
    self.memberUITextView.textAlignment = NSTextAlignmentCenter;
    self.memberUITextView.editable = NO;
    
    // UITextView-Doctor
    NSMutableAttributedString *doctorNSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Are you a doctor? {start4}Try our doctor app >{end4}", nil) attributes:@{
                                                                                                                                                                                     NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSRange rangeOfStart4NSString = [[doctorNSMutableAttributedString string] rangeOfString:@"{start4}"];
    NSRange rangeOfEnd4NSString = [[doctorNSMutableAttributedString string] rangeOfString:@"{end4}"];
    int start4Index = (int)(rangeOfStart4NSString.location + rangeOfStart4NSString.length);
    int end4Index = (int)rangeOfEnd4NSString.location;
    NSRange specialRange4 = NSMakeRange(start4Index, end4Index - start4Index);
    NSDictionary *doctorAppAttributesDictionary = @{
                                                NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSLinkAttributeName:[NSURL URLWithString:@"http://www.healthtap.com"]};
    [doctorNSMutableAttributedString setAttributes:doctorAppAttributesDictionary range:specialRange4];
    [doctorNSMutableAttributedString deleteCharactersInRange:[[doctorNSMutableAttributedString string] rangeOfString:@"{start4}"]];
    [doctorNSMutableAttributedString deleteCharactersInRange:[[doctorNSMutableAttributedString string] rangeOfString:@"{end4}"]];
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
