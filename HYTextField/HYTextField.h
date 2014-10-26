//
//  HYTextField.h
//  WeWalk
//
//  Created by Stella Mao on 10/25/14.
//  Our customized text field
//  Highlighted:
//  - can init with placeholder text

#import <UIKit/UIKit.h>

@interface HYTextField : UITextField

//Designated initializer
-(id) initWithFrame:(CGRect)frame withPlaceHolderText: (NSString *)text;

@end
