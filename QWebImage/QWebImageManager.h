//
//  QWebImageManager.h
//  QWebImage
//
//  Created by JHQ0228 on 16/7/12.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QWebImageManager : NSObject

/**
 *  创建单例类对象
 */
+ (instancetype)sharedManager;

/**
 *  创建下载
 *
 *  @param urlStr     图片地址
 *  @param completion 下载完成回调
 */
- (void)downloadImage:(NSString *)urlStr completion:(void (^) (UIImage *image))completion;

/**
 *  取消下载
 *
 *  @param urlStr   图片地址
 */
- (void)cancelDownload:(NSString *)urlStr;

@end
