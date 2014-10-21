//
//  ParseUserDataAccessor.m
//  ParseStarterProject
//
//  Created by Zhuoxing Mao on 10/21/14.
//
//

#import "ParseUserDataAccessor.h"

@implementation ParseUserDataAccessor

-(User *) getUserWithUsername:(NSString *)username{
    //NSString *username = self.usernameField.text;
    //NSString *password = self.passwordField.text;
    NSString *usernamePredicate = @"username = '";
    usernamePredicate = [usernamePredicate stringByAppendingString: username];
    usernamePredicate = [usernamePredicate stringByAppendingString: @"'"];
    NSPredicate *loginPredicate = [NSPredicate predicateWithFormat: usernamePredicate];
    
    PFQuery *query = [PFQuery queryWithClassName:@"WeWalkUser" predicate:loginPredicate];
    
    User *user = [[User alloc] init];
//    [query getFirstObject:^(PFObject *currentUser, NSError *error) {
//        if (!currentUser) {
//            NSLog(@"User not registered!");
//        } else {
//            // The find succeeded.
//            user.userName = currentUser[@"username"];
//            user.hashedPassword = [self getHashedPassword:currentUser[@"password"]];
//        }
//    }];
    PFObject *currentUser = [query getFirstObject];
    if (!currentUser) {
        NSLog(@"User not registered!");
    } else {
        // The find succeeded.
        user.userName = currentUser[@"username"];
        user.hashedPassword = [self getHashedPassword:currentUser[@"password"]];
    }
    return user;
}

-(NSString* ) getHashedPassword: (NSString *) password {
    //TODO : use a utility function here
    return password;
}

-(BOOL) loginWithUsername:(NSString *) username Password:(NSString *) password{
    User * currentUser = [self getUserWithUsername: username];
    return [currentUser.hashedPassword isEqualToString: [self getHashedPassword: password]];
}

-(BOOL) signupUser:(User *) user{
    return YES;
}

@end
