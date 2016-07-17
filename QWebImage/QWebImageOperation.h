//
//  QWebImageOperation.h
//  QWebImage
//
//  Created by JHQ0228 on 16/7/12.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QWebImageOperation : NSOperation

/**
 *  创建图片下载操作
 *
 *  @param urlStr     图片地址
 *  @param completion 下载完成回调
 *
 *  @return 图片下载操作
 */
+ (instancetype)q_webImageOperationWithURLString:(NSString *)urlStr completion:(void (^)(UIImage *image))completion;

@end
