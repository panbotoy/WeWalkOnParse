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
@property (strong, nonatomic) UITapGestureRecognizer *tapRecognizer;

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
    NSString *usernamePredicate = @"username = '";
    usernamePredicate = [usernamePredicate stringByAppendingString: username];
    usernamePredicate = [usernamePredicate stringByAppendingString: @"'"];
    NSPredicate *loginPredicate = [NSPredicate predicateWithFormat: usernamePredicate];
    
    PFQuery *query = [PFQuery queryWithClassName:@"WeWalkUser" predicate:loginPredicate];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *currentUser, NSError *error) {
        if (!currentUser) {
            NSLog(@"User not registered!");
        } else {
            // The find succeeded.
            if ([password isEqualToString: currentUser[@"password"]]){
                NSLog(@"Successfully logged in!");
            }
            else {
                NSLog(@"Incorrect password! Try again!");
            }
        }
    }];
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

@end
