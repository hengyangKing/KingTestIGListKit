//
//  IGListSectionController_1.m
//  KingTestIGListKit
//
//  Created by imooc on 2018/1/4.
//  Copyright © 2018年 imooc. All rights reserved.
//

#import "IGListSectionController_1.h"
#import "Cell.h"
#import "Model.h"
@interface IGListSectionController_1()
@property(nonatomic,strong)NSMutableArray *datas;
@end
@implementation IGListSectionController_1
-(NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}
#pragma mark - OverWrite
-(UIEdgeInsets)inset
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
-(CGSize)sizeForItemAtIndex:(NSInteger)index
{
    CGFloat width  = self.collectionContext.containerSize.width;
    CGFloat height = 44;
    return CGSizeMake(width, height);
}
- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    Cell *cell = [self.collectionContext dequeueReusableCellOfClass:[Cell class] forSectionController:self atIndex:index];
    [cell.contentView setBackgroundColor:[UIColor redColor]];
    Model *model = self.datas[index];
    [cell setText:model.num];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    
    NSLog(@"object 1 --- %@",object);
    if (object) {
        [self.datas addObject:object];
    }
}



@end
