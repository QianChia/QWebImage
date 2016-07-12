//
//  AppInfoCell.h
//  OCImageCache
//
//  Created by JHQ0228 on 16/6/26.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppInfoCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *downloadLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;

@end
