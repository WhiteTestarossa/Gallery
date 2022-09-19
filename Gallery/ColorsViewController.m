//
//  ColorsViewController.m
//  Gallery
//
//  Created by Daniel Belokursky on 13.09.22.
//

#import "ColorsViewController.h"

@interface ColorsViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *colors;
@property (strong, nonatomic) NSArray *colorNames;
@end

@implementation ColorsViewController

#pragma mark: Static Variables

static UIColor *_drawColor = nil;

+ (UIColor *)drawColor
{
    if (_drawColor == nil)
    {
        _drawColor = [[UIColor alloc] initWithRed:146.0/255.0 green:0.0/255.0 blue:59.0/255.0 alpha:1.0];
    }
    return  _drawColor;
}

+ (void)setDrawColor:(UIColor *)drawColor
{
    if (drawColor != _drawColor)
    {
        _drawColor = [drawColor copy];
    }
}

static NSString *_drawColorName = nil;

+ (NSString *)drawColorName
{
    if (_drawColorName == nil)
    {
        _drawColorName = @"#92003b";
    }
    return  _drawColorName;
}

+ (void)setDrawColorName:(NSString *)drawColorName
{
    if (drawColorName != _drawColorName)
    {
        _drawColorName = [drawColorName copy];
    }
}


#pragma mark: Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:UIColor.whiteColor];
    [self setupTableView];
    [self fillColors];
}

#pragma mark: Setup UI

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
       [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
       [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
       [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
       [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
}

- (void)fillColors
{
    self.colors = [[NSArray alloc] initWithObjects:
    [UIColor colorWithRed:190.0/255.0 green:40.0/255.0 blue:19.0/255.0 alpha:1.0],
    [UIColor colorWithRed:56.0/255.0 green:2.0/255.0 blue:218.0/255.0 alpha:1.0],
    [UIColor colorWithRed:70.0/255.0 green:124.0/255.0 blue:36.0/255.0 alpha:1.0],
    [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0],
    [UIColor colorWithRed:142.0/255.0 green:90.0/255.0 blue:247.0/255.0 alpha:1.0],
    [UIColor colorWithRed:240.0/155.0 green:127.0/255.0 blue:90.0/255.0 alpha:1.0],
    [UIColor colorWithRed:243.0/255.0 green:175.0/255.0 blue:34.0/255.0 alpha:1.0],
    [UIColor colorWithRed:61.0/255.0 green:172.0/255.0 blue:247.0/255.0 alpha:1.0],
    [UIColor colorWithRed:232.0/255.0 green:122.0/255.0 blue:164.0/255.0 alpha:1.0],
    [UIColor colorWithRed:15.0/255.0 green:46.0/255.0 blue:63.0/255.0 alpha:1.0],
    [UIColor colorWithRed:33.0/255.0 green:55.0/255.0 blue:17.0/255.0 alpha:1.0],
    [UIColor colorWithRed:81.0/255.0 green:19.0/255.0 blue:7.0/255.0 alpha:1.0],
    [UIColor colorWithRed:146.0/255.0 green:0.0/255.0 blue:59.0/255.0 alpha:1.0],
    nil];
    
    self.colorNames = [[NSArray alloc] initWithObjects:
    @"#be2813", @"#3802da", @"#467c24", @"#808080", @"#8e5af7", @"#f07f5a",
    @"#f3af22", @"#3dacf7", @"#e87aa4", @"#0f2e3f", @"#213711", @"#511307",
    @"#92003b", nil];
    
}

#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ColorsViewController.drawColor = self.colors[indexPath.row];
    ColorsViewController.drawColorName = self.colorNames[indexPath.row];
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.colorNames[indexPath.row];
    cell.textLabel.textColor = self.colors[indexPath.row];
    cell.tintColor = UIColor.redColor;
    
    if ([self.colors[indexPath.row] isEqual: ColorsViewController.drawColor])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}


@end
