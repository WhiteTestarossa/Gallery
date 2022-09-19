//
//  SettingsViewController.h
//  Gallery
//
//  Created by Daniel Belokursky on 11.09.22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (class, assign, nonatomic) BOOL toDraw;
@end

NS_ASSUME_NONNULL_END
