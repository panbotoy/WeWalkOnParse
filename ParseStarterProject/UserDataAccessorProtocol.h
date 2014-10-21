//
//  UserDataAccessorProtocol.h
//  ParseStarterProject
//
//  Created by Zhuoxing Mao on 10/20/14.
//
//

#import <Foundation/Foundation.h>
#import "User.h"

/**
 The accessor protocol for all user data accessors
 */
@protocol UserDataAccessorProtocol <NSObject>

@required

-(User *) getUserWithUsername:(NSString *)username;

-(BOOL) loginWithUsername:(NSString *) username Password:(NSString *) password;

-(BOOL) signupUser:(User *) user;

@end
