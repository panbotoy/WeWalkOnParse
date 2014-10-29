//
//  HYImageTextLabel.m
//  WeWalk
//
//  Created by Stella Mao on 10/28/14.
//
//

#import "HYImageTextLabel.h"

@interface HYImageTextLabel()

@property (nonatomic, strong) UIImageView *imageview;
@property (nonatomic, strong) UILabel *label;

@end

@implementation HYImageTextLabel

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withImage:nil withLabel:@""];
}

//This is for the square icon image - height = width for the image icon
- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)img withLabel:(NSString *)lbl
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.height, frame.size.height)];
        [self.imageview setImage:img];
        [self addSubview:self.imageview];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake((frame.origin.x + frame.size.height + 5), frame.origin.y, (frame.size.width - frame.size.height),frame.size.height)];
        self.label.text = lbl;
        self.label.textColor = [UIColor colorWithRed:76.0f/255.0f green:76.0f/255.0f blue:76.0f/255.0f alpha:1.0f];
        self.label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0f];
        
        [self addSubview:self.label];
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
