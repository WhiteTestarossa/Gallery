//
//  ColorsViewController.h
//  Gallery
//
//  Created by Daniel Belokursky on 13.09.22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (class, strong, nonatomic) UIColor *drawColor;
@property (class, strong, nonatomic) NSString *drawColorName;
@end

NS_ASSUME_NONNULL_END
