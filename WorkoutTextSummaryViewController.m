//
//  WorkoutTextSummaryViewController.m
//  WeWalk
//
//  Created by Stella Mao on 10/27/14.
//
//

#import "WorkoutTextSummaryViewController.h"
#import "HYImageTextLabel.h"

@interface WorkoutTextSummaryViewController ()

@end

@implementation WorkoutTextSummaryViewController

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
    HYImageTextLabel *cView = [[HYImageTextLabel alloc] initWithFrame:CGRectMake(20, 50, 200, 34) withImage:[UIImage imageNamed:@"walking"] withLabel:@"Speed"];
    HYImageTextLabel *dView = [[HYImageTextLabel alloc] initWithFrame:CGRectMake(20, 75, 200, 34) withImage:[UIImage imageNamed:@"clock"] withLabel:@"Duration"];
    HYImageTextLabel *fView = [[HYImageTextLabel alloc] initWithFrame:CGRectMake(20, 100, 200, 34) withImage:[UIImage imageNamed:@"route"] withLabel:@"Distance"];
    [self.view addSubview:cView];
    [self.view addSubview:dView];
    [self.view addSubview:fView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
