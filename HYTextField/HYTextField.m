//
//  HYTextField.m
//  WeWalk
//
//  Created by Stella Mao on 10/25/14.
//  Our customized text field
//  Highlighted:
//  - can init with placeholder text

#import "HYTextField.h"

@implementation HYTextField

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withPlaceHolderText:@""];
}

//Designated initializer
- (id)initWithFrame:(CGRect)frame withPlaceHolderText:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        self.keyboardAppearance = UIKeyboardAppearanceDark;
        self.keyboardType = UIKeyboardTypeAlphabet;
        //TODO: further customization - like for the title field, should be auto capital, but other field, may not.
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textColor = [UIColor blackColor];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.returnKeyType = UIReturnKeyNext;
        self.placeholder = text;
        
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Chalkboard SE" size:18], NSForegroundColorAttributeName: [UIColor lightGrayColor]};
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:attributes];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
