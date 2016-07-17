//
//  QWebImage.h
//  QWebImage
//
//  Created by JHQ0228 on 16/7/12.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (QWebImageView)

/**
 *  设置 Web 图像
 *
 *  @param urlStr   图片地址
 */
- (void)q_setWebImageWithURLStr:(NSString *)urlStr;

@end
