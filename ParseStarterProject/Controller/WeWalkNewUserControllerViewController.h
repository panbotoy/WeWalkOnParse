//
//  WeWalkNewUserControllerViewController.h
//  ParseStarterProject
//
//  Created by Stella Mao on 10/19/14.
//
//

#import <UIKit/UIKit.h>
@class WeWalkNewUserControllerViewController;

@protocol WeWalkNewUserControllerViewControllerDelegate <NSObject>

- (void)newUserViewControllerDidSignup:(WeWalkNewUserControllerViewController *)controller;

@end

@interface WeWalkNewUserControllerViewController : UIViewController

@property (nonatomic, weak) id<WeWalkNewUserControllerViewControllerDelegate> delegate;

@end
