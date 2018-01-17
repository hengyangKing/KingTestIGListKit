//
//  Model.h
//  KingTestIGListKit
//
//  Created by imooc on 2018/1/4.
//  Copyright © 2018年 imooc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGListKit.h"

@interface Model : NSObject<IGListDiffable>
@property(nonatomic,copy)NSString *num;

@end
