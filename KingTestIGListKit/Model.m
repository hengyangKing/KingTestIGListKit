//
//  Model.m
//  KingTestIGListKit
//
//  Created by imooc on 2018/1/4.
//  Copyright © 2018年 imooc. All rights reserved.
//

#import "Model.h"

@implementation Model
- (nonnull id<NSObject>)diffIdentifier{
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object
{
    if (object == self) {
        return YES;
    }
    return [self isEqual:object];
}
@end
