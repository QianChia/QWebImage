//
//  AppInfoModel.m
//  OCImageCache
//
//  Created by JHQ0228 on 16/6/26.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import "AppInfoModel.h"

@implementation AppInfoModel

+ (NSArray *)loadPList {
    
    NSArray *array = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil]];
    
    NSMutableArray *plist = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        id model = [[self alloc] init];
        [model setValuesForKeysWithDictionary:obj];
        
        [plist addObject:model];
    }];
    
    return plist;
}

@end
