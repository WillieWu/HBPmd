//
//  HBdansView.m
//  弹幕
//
//  Created by 伍宏彬 on 15/10/14.
//  Copyright (c) 2015年 伍宏彬. All rights reserved.
//

#import "HBdansView.h"
#import "HBdansLable.h"

@interface HBdansView()<HBdansLableDelegate>

@property (nonatomic, strong) NSMutableSet *randomSet;

@property (nonatomic, strong) NSMutableArray *randomMutableArray;

@end

@implementation HBdansView

- (instancetype)initDansViewFrame:(CGRect)frame contents:(NSMutableArray *)contents
{
    self = [super initWithFrame:frame];
    if (self) {
        self.randomMutableArray = contents;
         [self setInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setInit];
    }
    return self;
}
- (void)setInit
{
    self.textBackColor = [UIColor whiteColor];
    self.count = 1;

}
- (void)starDans
{
    if (!self.randomMutableArray.count) return;
    [self addRandomText:[self.randomMutableArray firstObject]];
    [self.randomMutableArray removeObjectAtIndex:0];
}
- (void)addRandomText:(NSString *)randomText
{
    
    if (!randomText.length) return;
    if (![self dequeRandomLable:randomText]) {
        
        [self.randomMutableArray addObject:randomText];
        
    }
    
}
- (HBdansLable *)dequeRandomLable:(NSString *)text
{
    HBdansLable *randomLable = [self.randomSet anyObject];
    
    [self addSubview:randomLable];
    
    if (randomLable) {
        
        [self.randomSet removeObject:randomLable];
        
        randomLable.text = text;
        
    }
    return randomLable;
}

- (CGRect)randomFrame
{
    CGFloat randomW = 10;
    CGFloat randomH = 44;
    CGFloat randomX = [UIScreen mainScreen].bounds.size.width;
    CGFloat randomY = arc4random_uniform(self.height - randomH);
    
    return CGRectMake(randomX, randomY, randomW, randomH);
}
#pragma mark - HBdansLableDelegate
- (void)dansLable:(HBdansLable *)dansLable isOutScreen:(BOOL)isOutScreen
{
    if (isOutScreen) {
        
        dansLable.x = CGRectGetMaxX(self.frame);
        dansLable.y = arc4random_uniform(self.height - 44);
        
        [self.randomSet addObject:dansLable];
        [dansLable removeFromSuperview];
        
        NSLog(@"缓存池数量：%@",@(self.randomSet.count));
        
        if (self.randomMutableArray.count){
            
            [self dequeRandomLable:[self.randomMutableArray firstObject]];
            [self.randomMutableArray removeObjectAtIndex:0];
            
        }
    }
}
#pragma mark - getter
- (NSMutableArray *)randomMutableArray
{
    if (!_randomMutableArray) {
        _randomMutableArray = [NSMutableArray array];
    }
    return _randomMutableArray;
}
- (NSMutableSet *)randomSet
{
    if (!_randomSet) {
        
        _randomSet = [NSMutableSet set];
        
        //    随机
        if (self.count > 10) self.count = 10;
        for (NSInteger i = 0; i < self.count; i++) {
            
            HBdansLable *randomLable = [HBdansLable dansLableFrame:[self randomFrame]];
            randomLable.delegate = self;
            randomLable.roundVaule = self.roundVaule;
            randomLable.lineColor = self.lineColor;
            randomLable.lineWidth = self.lineWidth;
            randomLable.backgroundColor = self.textBackColor;
            [self.randomSet addObject:randomLable];
            
        }
    }
    return _randomSet;
}
@end
