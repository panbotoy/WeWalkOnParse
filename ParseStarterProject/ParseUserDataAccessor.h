//
//  ParseUserDataAccessor.h
//  ParseStarterProject
//
//  Created by Zhuoxing Mao on 10/21/14.
//
//

#import <Foundation/Foundation.h>
#import "UserDataAccessor.h"
#import <Parse/Parse.h>

@interface ParseUserDataAccessor : UserDataAccessor
-(User *) getUserWithUsername:(NSString *)username;

-(BOOL) loginWithUsername:(NSString *) username Password:(NSString *) password;

-(BOOL) signupUser:(User *) user;
@end
