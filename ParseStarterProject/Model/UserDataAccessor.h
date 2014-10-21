//
//  UserDataAccessor.h
//  ParseStarterProject
//
//  Created by Stella Mao on 10/19/14.
//
//

#import "WeWalkDataAccessor.h"
#import "UserDataAccessorProtocol.h"
#import "User.h"

@interface UserDataAccessor : NSObject <UserDataAccessorProtocol>

-(User *) getUserWithUsername:(NSString *)username;

-(BOOL) loginWithUsername:(NSString *) username Password:(NSString *) password;

-(BOOL) signupUser:(User *) user;

@end
