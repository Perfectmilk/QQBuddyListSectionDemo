//
//  LGPTableViewHeaderView.h
//  QQ好友列表Demo
//
//  Created by 李广鹏 on 16/6/12.
//  Copyright © 2016年 李广鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGPSectionModel;

typedef void (^headerButtonClickBlock)(BOOL isExpanded);

@interface LGPTableViewHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) LGPSectionModel *sectionModel;

@property (nonatomic, copy) headerButtonClickBlock clickBlock;

@end
