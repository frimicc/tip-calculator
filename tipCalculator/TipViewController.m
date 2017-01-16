//
//  ViewController.m
//  tipCalculator
//
//  Created by  Michael Friedman on 1/12/17.
//  Copyright © 2017  Michael Friedman. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";

    // get default value when view is created
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger savedDefaultTipChoice = [defaults integerForKey:@"defaultTipChoice"];
    self.tipControl.selectedSegmentIndex = savedDefaultTipChoice;

    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *TipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [TipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;

    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount ];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount ];

}

// Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SettingsViewController *settingsViewController = [segue destinationViewController];
    settingsViewController.delegate = self;

}

// Implement the delegate methods for SettingsViewControllerDelegate
- (void)SettingsViewController:(SettingsViewController *)viewController defaultTipDidChange:(NSInteger)value {

    self.tipControl.selectedSegmentIndex = value;
    [self updateValues];

}

@end
