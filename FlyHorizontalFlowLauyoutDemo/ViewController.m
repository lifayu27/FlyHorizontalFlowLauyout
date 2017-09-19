//
//  ViewController.m
//  FlyHorizontalFlowLauyoutDemo
//
//  Created by lifayu on 2017/9/19.
//  Copyright © 2017年 lifayu. All rights reserved.
//

#import "ViewController.h"
#import "FlyHorizontalFlowLauyout.h"

#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>


@property (nonatomic, strong) NSMutableArray* dataArray;

@property (nonatomic, strong) UICollectionView* collectionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //横向滚动
    FlyHorizontalFlowLauyout *horizontalLayout = [[FlyHorizontalFlowLauyout alloc] init];
    
    horizontalLayout.itemSize = CGSizeMake((kScreenWidth - 30 - 1.5)/4, (kScreenWidth - 30 - 1.5)/4);
    horizontalLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    horizontalLayout.minimumLineSpacing = 0.5;
    horizontalLayout.minimumInteritemSpacing = 0.5;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, kScreenWidth) collectionViewLayout:horizontalLayout];
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _collectionView.pagingEnabled = YES;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.bounces = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor blueColor];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
}

#pragma mark 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 6;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 20;
    }
    else if (section == 1) {
        return 5;
    }
    else if (section == 2) {
        return 19;
    }
    else if (section == 3) {
        return 23;
    }
    else if (section == 4) {
        return 5;
    }
    return 3;
    
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    label.textColor = [UIColor blueColor];
    label.numberOfLines = 0;
    [cell.contentView addSubview:label];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section %ld  row --- %ld",indexPath.section, indexPath.row);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
