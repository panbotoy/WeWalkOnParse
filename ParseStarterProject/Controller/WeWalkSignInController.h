//
//  WeWalkSignInController.h
//  ParseStarterProject
//
//  Created by Stella Mao on 10/19/14.
//
//

#import <UIKit/UIKit.h>

@class WeWalkSignInController;

@protocol WeWalkSignInControllerDelegate <NSObject>

- (void)loginViewControllerDidLogin:(WeWalkSignInController *)controller;

@end

@interface WeWalkSignInController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *usernameField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) id<WeWalkSignInControllerDelegate> delegate;


@end
