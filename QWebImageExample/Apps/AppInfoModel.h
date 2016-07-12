//
//  AppInfoModel.h
//  OCImageCache
//
//  Created by JHQ0228 on 16/6/26.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfoModel : NSObject

/// 标题名称
@property (nonatomic, strong) NSString *name;

/// 下载数量
@property (nonatomic, strong) NSString *download;

/// 图片地址
@property (nonatomic, strong) NSString *icon;

/// 从 Plist 加载 AppInfo
+ (NSArray *)loadPList;

@end
