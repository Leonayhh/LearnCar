//
//  PopTableview.m
//  PinchFish
//
//  Created by 进超王 on 16/10/14.
//  Copyright © 2016年 进超王. All rights reserved.
//

#import "PopTableview.h"

#define kHCell 40

@implementation PopTableview

- (instancetype)initWithFrame:(CGRect)frame withTittle:(NSArray *)titleArr {
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArr = [[NSArray alloc]initWithArray:titleArr];
        self.backgroundColor = [UIColor whiteColor];

        self.mTableview = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, self.width, self.height)  style:UITableViewStylePlain];
        [self.mTableview registerNib:[UINib nibWithNibName:@"PopTableviewCell" bundle:nil] forCellReuseIdentifier:@"PopTableviewCell"];
        self.mTableview.backgroundColor = [UIColor whiteColor];
        self.mTableview.delegate = self;
        self.mTableview.dataSource = self;
        self.mTableview.scrollEnabled = NO;
        [self addSubview:self.mTableview];
        
        PopheaderView *view = [[PopheaderView alloc] initWithFrame:CGRectMake(0, 0,kScreenW , 40)];
        self.mTableview.tableHeaderView = view;
    }
    return self;
}



- (void) footClick {
    if ([self.delegate respondsToSelector:@selector(cellDidSelectWithIndex: isCancel:)]) {
        [self.delegate cellDidSelectWithIndex:nil isCancel:YES];
    }
}

#pragma mark 代理方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kHCell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *idf = @"PopTableviewCell";
    PopTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:idf forIndexPath:indexPath];
    cell.namelable.text = self.dataArr[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(cellDidSelectWithIndex: isCancel:)]) {
        [self.delegate cellDidSelectWithIndex:indexPath isCancel:NO];
    }
}










@end
