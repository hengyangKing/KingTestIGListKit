//
//  ViewController.m
//  KingTestIGListKit
//
//  Created by imooc on 2018/1/4.
//  Copyright © 2018年 imooc. All rights reserved.
//

#import "ViewController.h"
#import "IGListKit.h"
#import "Model.h"
#import "Model2.h"
#import "IGListSectionController_1.h"
#import "IGListSectionController_2.h"
#import "Masonry.h"
@interface ViewController ()<IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSMutableArray *)dataSourceArr
{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [collectionView setBackgroundColor:[UIColor whiteColor]];
        self.collectionView = collectionView;
        [self.view addSubview:self.collectionView];
    }
    return _collectionView;
}
-(IGListAdapter *)adapter
{
    if (!_adapter) {
        IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
        _adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
    }
    return _adapter;
}
-(void)setupView {
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    //依赖
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    __weak typeof(self) weakself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        for (int i = 0; i<10; i++) {
            Model *model = [Model new];
            [model setNum:[NSString stringWithFormat:@"%@",@(i)]];
            [self.dataSourceArr addObject:model];
        }
        for (int i = 10; i<20; i++) {
            Model2 *model = [Model2 new];
            [model setNum:[NSString stringWithFormat:@"%@",@(i)]];
            [self.dataSourceArr addObject:model];
        }
        for (int i = 20; i<30; i++) {
            Model *model = [Model new];
            [model setNum:[NSString stringWithFormat:@"%@",@(i)]];
            [self.dataSourceArr addObject:model];
        }
        for (int i = 30; i<40; i++) {
            Model2 *model = [Model2 new];
            [model setNum:[NSString stringWithFormat:@"%@",@(i)]];
            [self.dataSourceArr addObject:model];
        }
        [weakself.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
            
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself.dataSourceArr removeObjectAtIndex:0];
    });
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataSourceArr;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    
    if ([object isMemberOfClass:[Model class]]) {
        return [IGListSectionController_1 new];
    }else if ([object isMemberOfClass:[Model2 class]]){
        return [IGListSectionController_2 new];
    }
    
    return nil;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    
    return nil;
}
@end
