//
//  User.h
//  ParseStarterProject
//
//  Created by Stella Mao on 10/19/14.
//
//

#import <Foundation/Foundation.h>

@interface User : NSObject


@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userEmail;
@property (nonatomic, strong) NSString *hashedPassword;

@end
