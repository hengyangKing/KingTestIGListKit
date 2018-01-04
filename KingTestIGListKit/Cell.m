//
//  Cell.m
//  KingTestIGListKit
//
//  Created by imooc on 2018/1/4.
//  Copyright © 2018年 imooc. All rights reserved.
//

#import "Cell.h"
#import "Masonry.h"
@implementation Cell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
-(void)setup{
    
    UILabel *label = [[UILabel alloc]init];
    [label setTextAlignment:(NSTextAlignmentCenter)];
    [label setFont:[UIFont systemFontOfSize:16]];
    [label setTextColor:[UIColor whiteColor]];
    [label setTag:1000];
    [self addSubview:label];
    [label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}

-(void)setText:(NSString *)text
{
    _text = [text copy];
    UIView *view = [self viewWithTag:1000];
    if ([view isMemberOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)view;
        [label setText:_text];
    }
}
@end
