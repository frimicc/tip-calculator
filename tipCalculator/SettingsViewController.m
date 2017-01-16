//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by  Michael Friedman on 1/13/17.
//  Copyright © 2017  Michael Friedman. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger savedDefaultTipChoice = [defaults integerForKey:@"defaultTipChoice"];
    _defaultTipControl.selectedSegmentIndex = savedDefaultTipChoice;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTipChanged:(id)sender {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:_defaultTipControl.selectedSegmentIndex forKey:@"defaultTipChoice"];
    [defaults synchronize];

    id<SettingsViewControllerDelegate> strongDelegate = self.delegate;

    if ([strongDelegate respondsToSelector:@selector(SettingsViewController:defaultTipDidChange:)]) {
        [strongDelegate SettingsViewController:self defaultTipDidChange:self.defaultTipControl.selectedSegmentIndex];
    }

}

@end
