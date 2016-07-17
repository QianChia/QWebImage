//
//  QWebImageManager.m
//  QWebImage
//
//  Created by JHQ0228 on 16/7/12.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import "QWebImageManager.h"
#import "QWebImageOperation.h"
#import "QWebImageTools.h"

@interface QWebImageManager ()

/// 下载队列
@property (nonatomic, strong) NSOperationQueue *downloadQueue;

/// 下载缓冲池
@property (nonatomic, strong) NSMutableDictionary *downloadCache;

/// 图片缓冲池
@property (nonatomic, strong) NSMutableDictionary *imageCache;

@end

@implementation QWebImageManager

/// 创建单例类对象

+ (instancetype)sharedManager {
    
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

/// 创建下载

- (void)downloadImage:(NSString *)urlStr completion:(void (^)(UIImage *))completion {
    
    if ([self checkCacheWithURLString:urlStr]) {
        if (completion != nil) {
            completion(self.imageCache[urlStr]);
        }
        return;
    }
    
    if (self.downloadCache[urlStr] != nil) {
        return;
    }
    
    QWebImageOperation *downloadOperation = [QWebImageOperation q_webImageOperationWithURLString:urlStr completion:^(UIImage *image) {
        
        [self.downloadCache removeObjectForKey:urlStr];
        [self.imageCache setObject:image forKey:urlStr];
        
        if (completion != nil) {
            completion(image);
        }
    }];
    
    [self.downloadCache setObject:downloadOperation forKey:urlStr];
    [self.downloadQueue addOperation:downloadOperation];
}

/// 取消下载

- (void)cancelDownload:(NSString *)urlStr {
    
    QWebImageOperation *downloadOperation = self.downloadCache[urlStr];
    
    if (downloadOperation != nil) {
        [downloadOperation cancel];
        [self.downloadCache removeObjectForKey:urlStr];
    }
}

/// 注册内存警告通知

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(q_clearMemory) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

/// 移除内存警告通知

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/// 清理内存

- (void)q_clearMemory {
    
    [self.imageCache removeAllObjects];
    
    [self.downloadCache removeAllObjects];
    [self.downloadQueue cancelAllOperations];
}

/**
 *  判断缓存中是否存在图像
 *
 *  @param urlStr   图片地址
 *
 *  @return YES 存在图像，NO 不存在图像
 */
- (BOOL)checkCacheWithURLString:(NSString *)urlStr {
    
    if (self.imageCache[urlStr] != nil) {
        return YES;
    }
    
    UIImage *image = [UIImage imageWithContentsOfFile:[urlStr q_appendCachePath]];
    
    if (image != nil) {
        [self.imageCache setObject:image forKey:urlStr];
        return YES;
    }
    
    return NO;
}

/// 懒加载

- (NSOperationQueue *)downloadQueue {
    if (_downloadQueue == nil) {
        _downloadQueue = [[NSOperationQueue alloc] init];
        
        _downloadQueue.maxConcurrentOperationCount = 10;
    }
    return _downloadQueue;
}

- (NSMutableDictionary *)downloadCache {
    if (_downloadCache == nil) {
        _downloadCache = [[NSMutableDictionary alloc] init];
    }
    return _downloadCache;
}

- (NSMutableDictionary *)imageCache {
    if (_imageCache == nil) {
        _imageCache = [[NSMutableDictionary alloc] init];
    }
    return _imageCache;
}

@end
