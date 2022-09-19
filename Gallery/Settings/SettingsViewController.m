//
//  SettingsViewController.m
//  Gallery
//
//  Created by Daniel Belokursky on 11.09.22.
//

#import "SettingsViewController.h"
#import "ColorsViewController.h"

@interface SettingsViewController ()

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation SettingsViewController

#pragma mark - Static Variables

static BOOL _toDraw = TRUE;

+ (void)setToDraw:(BOOL)newToDraw
{
    _toDraw = newToDraw;
}

+ (BOOL)toDraw
{
    return _toDraw;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Settings";
    [self setupTableView];
    [self.view setBackgroundColor:UIColor.whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Methods

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView registerClass: UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview: self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
       [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
       [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
       [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
       [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
}

- (void)changeSwitch:(UISwitch *)sender
{
    SettingsViewController.toDraw = sender.isOn;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if (indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.textLabel.text = @"Draw strories";
        UISwitch *switchView = [[UISwitch alloc] init];
        switchView.on = TRUE;
        [switchView addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = switchView;
        
    } else if (indexPath.row == 1) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
        cell.textLabel.text = @"Stroker color";
        cell.detailTextLabel.text = ColorsViewController.drawColorName;
        cell.detailTextLabel.textColor = ColorsViewController.drawColor;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1){
        ColorsViewController *colorsVC = [[ColorsViewController alloc] init];
        [self.navigationController pushViewController:colorsVC animated:true];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        cell.detailTextLabel.text = ColorsViewController.drawColorName;
    }
}

@end
