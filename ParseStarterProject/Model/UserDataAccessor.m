//
//  UserDataAccessor.m
//  ParseStarterProject
//
//  Created by Stella Mao on 10/19/14.
//
//

#import "UserDataAccessor.h"
#import "User.h"

@implementation UserDataAccessor : NSObject

-(User *) getUserWithUsername:(NSString *)username {
    return [[User alloc] init];
}

-(BOOL) loginWithUsername:(NSString *) username Password:(NSString *) password{
    return YES;
}

-(BOOL) signupUser:(User *) user{
    return YES;
}

@end
