//
//  WeWalkSignInController.m
//  ParseStarterProject
//
//  Created by Stella Mao on 10/19/14.
//
//

#import "WeWalkSignInController.h"
#import "WeWalkNewUserControllerViewController.h"
#import <Parse/Parse.h>

#import "UserDataAccessor.h"
#import "ParseUserDataAccessor.h"

@interface WeWalkSignInController ()
<UITextFieldDelegate,
UIScrollViewDelegate,
WeWalkNewUserControllerViewControllerDelegate,
WeWalkSignInControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) UITapGestureRecognizer *tapRecognizer;
@property (strong, nonatomic) IBOutlet UIButton *signupButton;

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
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                action:@selector(didTapAnywhere:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Actions

- (IBAction)signInButtonPressed:(UIButton *)sender {
    // Commented out code for store a user in Parse. Left for future.
//    PFObject *user = [PFObject objectWithClassName: @"WeWalkUser"];
//    user[@"username"] = @"panbo";
//    user[@"password"] = @"123";
//    [user saveInBackground];
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    UserDataAccessor * da = [[ParseUserDataAccessor alloc] init];
    if (![da loginWithUsername:username Password:password]){
        NSLog(@"Login failed! Please check username and password!");
    } else {
        NSLog(@"Successfully logged in!");
    }
}

- (IBAction)signUpButtonPressed:(UIButton *)sender {
    [self presentNewUserViewController];
}


-(void) keyboardWillShow:(NSNotification *) note {
    [self.view addGestureRecognizer:self.tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification *) note
{
    [self.view removeGestureRecognizer:self.tapRecognizer];
}

-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (void)presentNewUserViewController {
    WeWalkNewUserControllerViewController *newViewController = [[WeWalkNewUserControllerViewController alloc] initWithNibName:nil bundle:nil];
    newViewController.delegate = self;
    [self.navigationController presentViewController:newViewController animated:YES completion:nil];
}

@end
