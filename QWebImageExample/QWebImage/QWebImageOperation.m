//
//  QWebImageOperation.m
//  QWebImage
//
//  Created by JHQ0228 on 16/7/12.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import "QWebImageOperation.h"
#import "QWebImageTools.h"

@interface QWebImageOperation ()

/// 下载图片的 URL
@property (nonatomic, copy) NSString *urlStr;

/// 下载完成的回调
@property (nonatomic, copy) void (^completion) (UIImage *image);

@end

@implementation QWebImageOperation

/// 创建图片下载操作

+ (instancetype)q_webImageOperationWithURLString:(NSString *)urlStr completion:(void (^)(UIImage *))completion {
    
    QWebImageOperation *imageOperation = [[self alloc] init];
    
    imageOperation.urlStr= urlStr;
    imageOperation.completion = completion;
    
    return imageOperation;
}

/// 执行操作

- (void)main {
    @autoreleasepool {
        
        if (self.isCancelled) return;
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlStr]];
        
        if (self.isCancelled) return;
        
        if (data != nil) {
            [data writeToFile:[self.urlStr q_appendCachePath] atomically:YES];
        }
        
        if (self.isCancelled) return;
        
        if (self.completion && data != nil) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.completion([UIImage imageWithData:data]);
            }];
        }
    }
}

@end
