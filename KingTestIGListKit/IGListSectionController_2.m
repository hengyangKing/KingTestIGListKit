//
//  IGListSectionController_2.m
//  KingTestIGListKit
//
//  Created by imooc on 2018/1/4.
//  Copyright © 2018年 imooc. All rights reserved.
//

#import "IGListSectionController_2.h"
#import "Cell.h"
#import "Model.h"
@interface IGListSectionController_2()
@property(nonatomic,strong)NSMutableArray *datas;

@end
@implementation IGListSectionController_2
-(NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}
-(void)setNum:(NSString *)num
{
    _num = [num copy];
}
#pragma mark - OverWrite
-(UIEdgeInsets)inset
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
-(CGSize)sizeForItemAtIndex:(NSInteger)index
{
    CGFloat width  = self.collectionContext.containerSize.width;
    CGFloat height = 88;
    return CGSizeMake(width, height);
}
- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    Cell *cell = [self.collectionContext dequeueReusableCellOfClass:[Cell class] forSectionController:self atIndex:index];
    [cell.contentView setBackgroundColor:[UIColor greenColor]];
    Model *model = self.datas[index];
    [cell setText:model.num];
    return cell;
}
- (void)didUpdateToObject:(id)object {
    
    NSLog(@"object 2 ---  %@",object);
    if (object) {
        [self.datas addObject:object];
    }
    
}



@end
