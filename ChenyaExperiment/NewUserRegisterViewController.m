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
@property (strong, nonatomic) IBOutlet UILabel *agreementUILabel;
@property (strong, nonatomic) IBOutlet UILabel *memberUILabel;
@property (strong, nonatomic) IBOutlet UILabel *doctorUILabel;
@end

@implementation NewUserRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UILabel-Instruction
    NSMutableAttributedString *instruction1NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Create a ", nil) attributes:@{
                                                                                                                                                                         NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:18.5]}];
    NSMutableAttributedString *instruction2NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"free, private ", nil) attributes:@{
                                                                                                                                                                         NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:18.5]}];
    NSMutableAttributedString *instruction3NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"account or login", nil) attributes:@{
                                                                                                                                                                               NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:18.5]}];
    [instruction1NSMutableAttributedString appendAttributedString:instruction2NSMutableAttributedString];
    [instruction1NSMutableAttributedString appendAttributedString:instruction3NSMutableAttributedString];
    self.instructionUILabel.attributedText = instruction1NSMutableAttributedString;
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
    
    // UILabel-Agreement
    NSMutableAttributedString *agreement1NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"You agree to our ", nil) attributes:@{
                                                                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSMutableAttributedString *agreement2NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Terms ", nil) attributes:@{
                                                                                                                                                                                 NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]}];
    NSMutableAttributedString *agreement3NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"and ", nil) attributes:@{
                                                                                                                                                                                 NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSMutableAttributedString *agreement4NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Privacy Policy ", nil) attributes:@{
                                                                                                                                                                    NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]}];
    [agreement1NSMutableAttributedString appendAttributedString:agreement2NSMutableAttributedString];
    [agreement1NSMutableAttributedString appendAttributedString:agreement3NSMutableAttributedString];
    [agreement1NSMutableAttributedString appendAttributedString:agreement4NSMutableAttributedString];
    self.agreementUILabel.attributedText = agreement1NSMutableAttributedString;
    [self.agreementUILabel sizeToFit];
    
    // UILabel-Member
    NSMutableAttributedString *member1NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Are you a member? ", nil) attributes:@{
                                                                                                                                                                           NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSMutableAttributedString *member2NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Login > ", nil) attributes:@{
                                                                                                                                                                                NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]}];
    [member1NSMutableAttributedString appendAttributedString:member2NSMutableAttributedString];
    self.memberUILabel.attributedText = member1NSMutableAttributedString;
    [self.memberUILabel sizeToFit];
    
    // UILabel-Doctor
    NSMutableAttributedString *doctor1NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Are you a doctor? ", nil) attributes:@{
                                                                                                                                                                               NSFontAttributeName: [UIFont fontWithName:@"Avenir-Book" size:14.0]}];
    NSMutableAttributedString *doctor2NSMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Try our doctor app > ", nil) attributes:@{
                                                                                                                                                                     NSFontAttributeName: [UIFont fontWithName:@"Avenir-Heavy" size:14.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0.38 green:0.87 blue:0.80 alpha:1.0]}];
    [doctor1NSMutableAttributedString appendAttributedString:doctor2NSMutableAttributedString];
    self.doctorUILabel.attributedText = doctor1NSMutableAttributedString;
    [self.doctorUILabel sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
