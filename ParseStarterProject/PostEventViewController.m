//
//  PostEventViewController.m
//  ParseStarterProject
//
//  Created by Stella Mao on 10/22/14.
//
//

#import "PostEventViewController.h"
#import "HYTextField.h"

@interface PostEventViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HYTextField *titleField;
@property (nonatomic, strong) HYTextField *timeField;
@property (nonatomic, strong) HYTextField *locationField;
@property (nonatomic, strong) HYTextField *descriptionField;
@property (nonatomic, strong) UIButton *postButton;
@property (strong, nonatomic) UITapGestureRecognizer *tapRecognizer;

@end

@implementation PostEventViewController

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
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.postButton];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                 action:@selector(didTapAnywhere:)];
}

-(void) keyboardWillShow:(NSNotification *) note {
    [self.view addGestureRecognizer:self.tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification *) note
{
    [self.view removeGestureRecognizer:self.tapRecognizer];
}

-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.titleField resignFirstResponder];
    [self.timeField resignFirstResponder];
    [self.locationField resignFirstResponder];
    [self.descriptionField resignFirstResponder];
}

#pragma mark - DataSource methods implementation

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const cellIdentifier = @"postEventInputIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor blackColor];
    }
    if (indexPath.row == 0) {
        [cell.contentView addSubview:self.titleField];
    } else if (indexPath.row
               == 1) {
        [cell.contentView addSubview:self.timeField];
    } else if (indexPath.row
               == 2) {
        [cell.contentView addSubview:self.locationField];
    } else if (indexPath.row
               == 3) {
        [cell.contentView addSubview:self.descriptionField];
    }
    return cell;
}

#pragma mark - UITableDelegate implementation

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self inputCellHeight];
}

#pragma mark - UITextFieldDelegate implementation

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.titleField) {
        [self.timeField becomeFirstResponder];
    } else if (textField == self.timeField) {
        [self.locationField becomeFirstResponder];
    } else if (textField == self.locationField) {
        [self.descriptionField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        if (textField == self.descriptionField) {
            [self postButtonTapped:self];
        }
    }
    return NO;
}

#pragma mark - UI action logic

-(void) postButtonTapped: (id)sender
{
    NSDictionary *formValues = @{ @"Event Title" : self.titleField.text,
                                  @"Time" : self.timeField.text,
                                  @"Location" : self.locationField.text,
                                  @"Description" : self.descriptionField.text};
    
    NSString *alertMessage = [NSString stringWithFormat:@"%@", formValues];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:alertMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

#pragma mark - Property Accessors

- (UITableView *) tableView
{
    if (!_tableView) {
        CGFloat tableMargin = (self.view.frame.size.width - [self tableWidth]) / 2;
        CGFloat tableHeight = [self inputCellHeight] * [self tableView: _tableView numberOfRowsInSection:0];
        //NSLog(@"Table height is %d", tableHeight);
        //CGFloat tableTopMargin = (self.view.frame.size.height - tableHeight) / 2;
        //NSLog(@"The top margin is %d", tableTopMargin);
        CGRect tableFrame = CGRectMake(tableMargin, 160.0f, [self tableWidth], tableHeight);
        
        _tableView = [[UITableView alloc] initWithFrame:tableFrame];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.scrollEnabled = NO;
        _tableView.backgroundView = nil;
        _tableView.layer.borderColor = [[UIColor grayColor] CGColor];
        // a slim border
        _tableView.layer.borderWidth = 1.0f;
        // then the table can stay in the center
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}

- (UITextField *) titleField
{
    if (!_titleField) {
        _titleField = [[HYTextField alloc] initWithFrame:CGRectMake(15.0f, [self textFieldTopMargin], [self textFieldWidth], [self textFieldHeight]) withPlaceHolderText:@"The cool event name"];
        _titleField.delegate = self;
    }
    return _titleField;
}

- (UITextField *) timeField
{
    if (!_timeField) {
        _timeField = [[HYTextField alloc] initWithFrame:CGRectMake(15.0f, [self textFieldTopMargin], [self textFieldWidth], [self textFieldHeight]) withPlaceHolderText:@"When"];
        _timeField.delegate = self;
    }
    return _timeField;
}

- (UITextField *) locationField
{
    if (!_locationField) {
        _locationField = [[HYTextField alloc] initWithFrame:CGRectMake(15.0f, [self textFieldTopMargin], [self textFieldWidth], [self textFieldHeight]) withPlaceHolderText:@"Where?"];
        _locationField.delegate = self;
    }
    return _locationField;
}

- (UITextField *) descriptionField
{
    if (!_descriptionField) {
        _descriptionField = [[HYTextField alloc] initWithFrame:CGRectMake(15.0f, [self textFieldTopMargin], [self textFieldWidth], [self textFieldHeight]) withPlaceHolderText:@"Add some description"];
        _descriptionField.delegate = self;
        //This is to hight light the return key
        _descriptionField.returnKeyType = UIReturnKeyGo;
    }
    return _descriptionField;
}

- (UIButton *) postButton
{
    if (!_postButton) {
        _postButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //NSLog(@"table view height is %d", self.tableView.frame.size.height);
        _postButton.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y + self.tableView.frame.size.height, [self tableWidth], [self inputCellHeight]);
        _postButton.backgroundColor = [UIColor orangeColor];
        [_postButton.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        [_postButton setTitle:@"Post" forState:UIControlStateNormal];
        _postButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [_postButton addTarget:self action:@selector(postButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _postButton;
}

#pragma mark - Size related

-(CGFloat) inputCellHeight
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 68.0f : 48.0f;
}

-(CGFloat) textFieldWidth
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 300.0f : 226.0f;
}

-(CGFloat) textFieldHeight
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 50.0f : 30.0f;
}

-(CGFloat) textFieldTopMargin
{
    return ([self inputCellHeight] - [self textFieldHeight]) / 2;
}

-(CGFloat) tableWidth
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 360.0f : 256.0f;
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

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
