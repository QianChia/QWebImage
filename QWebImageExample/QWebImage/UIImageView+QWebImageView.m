//
//  UIImageView+QWebImageView.m
//  QWebImage
//
//  Created by JHQ0228 on 16/7/12.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import "UIImageView+QWebImageView.h"
#import <objc/runtime.h>
#import "QWebImageManager.h"

@interface UIImageView ()

@property (nonatomic, copy) NSString *urlStr;

@end

@implementation UIImageView (QWebImageView)

/// 设置 Web 图像

- (void)q_setWebImageWithURLStr:(NSString *)urlStr {
    
    if ([self.urlStr isEqualToString:urlStr]) {
        return;
    }
    
    if (self.urlStr != nil && ![self.urlStr isEqualToString:urlStr]) {
        [[QWebImageManager sharedManager] cancelDownload:self.urlStr];
        self.image = nil;
    }
    
    self.urlStr = urlStr;
    
    __weak typeof(self) weakSelf = self;
    [[QWebImageManager sharedManager] downloadImage:self.urlStr completion:^(UIImage *image) {
        weakSelf.image = image;
    }];
}

/// 向分类添加属性

const void *URLStrKey = "URLStrKey";

- (void)setUrlStr:(NSString *)urlString {
    objc_setAssociatedObject(self, URLStrKey, urlString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)urlStr {
    return objc_getAssociatedObject(self, URLStrKey);
}

@end
