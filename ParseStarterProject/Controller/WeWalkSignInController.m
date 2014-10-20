//
//  WeWalkSignInController.m
//  ParseStarterProject
//
//  Created by Stella Mao on 10/19/14.
//
//

#import "WeWalkSignInController.h"
#import <Parse/Parse.h>

@interface WeWalkSignInController ()
<UITextFieldDelegate,
UIScrollViewDelegate,
WeWalkSignInControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation WeWalkSignInController

#pragma mark - 
#pragma mark LifeCycleRelated
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Actions

- (IBAction)signInButtonPressed:(UIButton *)sender {
    PFObject *user = [PFObject objectWithClassName: @"WeWalkUser"];
    user[@"username"] = @"panbo";
    user[@"password"] = @"123";
    [user saveInBackground];
}

@end
