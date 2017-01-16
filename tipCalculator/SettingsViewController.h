//
//  SettingsViewController.h
//  tipCalculator
//
//  Created by  Michael Friedman on 1/13/17.
//  Copyright © 2017  Michael Friedman. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SettingsViewControllerDelegate;

@interface SettingsViewController : UIViewController

@property (nonatomic, weak) id<SettingsViewControllerDelegate> delegate;

- (IBAction)onTipChanged:(id)sender;

@end

@protocol SettingsViewControllerDelegate <NSObject>

- (void)SettingsViewController:(SettingsViewController*)viewController
             defaultTipDidChange:(NSInteger)value;

@end
