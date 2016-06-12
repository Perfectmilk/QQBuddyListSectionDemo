//
//  LGPSectionModel.h
//  QQ好友列表Demo
//
//  Created by 李广鹏 on 16/6/12.
//  Copyright © 2016年 李广鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LGPCellModel;

@interface LGPSectionModel : NSObject

// 分组名称
@property (nonatomic, copy) NSString *sectionTitle;

// 闭合
@property (nonatomic, assign) BOOL isExpanded;

// 分组cell model
@property (nonatomic, strong) NSMutableArray<LGPCellModel *> *cellModels;


@end
