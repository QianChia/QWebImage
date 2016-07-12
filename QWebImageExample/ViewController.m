//
//  ViewController.m
//  QWebImageExample
//
//  Created by JHQ0228 on 16/7/12.
//  Copyright © 2016年 QianQian-Studio. All rights reserved.
//

#import "ViewController.h"
#import "AppInfoCell.h"
#import "AppInfoModel.h"

#import "UIImageView+QWebImageView.h"

@interface ViewController ()

/// 表格数据源
@property (nonatomic, strong) NSArray *dataSourceArray;

@end

@implementation ViewController

/// 懒加载

- (NSArray *)dataSourceArray {
    if (_dataSourceArray == nil) {
        _dataSourceArray = [AppInfoModel loadPList];
    }
    return _dataSourceArray;
}

/// 表格视图数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AppInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppCell" forIndexPath:indexPath];
    
    AppInfoModel *dataModel = self.dataSourceArray[indexPath.row];
    
    cell.nameLabel.text = dataModel.name;
    cell.downloadLabel.text = dataModel.download;
    
    [cell.iconImageView q_setWebImageWithURLStr:dataModel.icon];
    
    return cell;
}

@end
