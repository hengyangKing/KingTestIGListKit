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
@interface IGListSectionController_1()<IGListCollectionContext>
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
//    (CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    return UIEdgeInsetsMake(10, 0, 10, 0);
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
    if (self.datas.count) {
        Model *model = [self.datas objectAtIndex:index];
        cell.text(model.num);
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    
    if (object) {
        [self.datas addObject:object];
    }
}
- (void)didSelectItemAtIndex:(NSInteger)index {
    [self deselectItemAtIndex:index sectionController:self animated:YES];
    
}

- (void)didDeselectItemAtIndex:(NSInteger)index {
    
}

-(void)deselectItemAtIndex:(NSInteger)index sectionController:(IGListSectionController *)sectionController animated:(BOOL)animated
{
    
}


@end
