//
//  CalenderView.m
//  日历表
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 王进超. All rights reserved.
//

#import "CalenderView.h"
#import "UIColor+ZXLazy.h"

@interface CalenderCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *dateLabel;



@end

@implementation CalenderCell

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.frame = self.bounds;
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont systemFontOfSize:17]];
        _dateLabel.layer.cornerRadius = _dateLabel.bounds.size.height * 0.5;
        _dateLabel.layer.masksToBounds = YES;
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}
@end

@interface CalenderView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSCalendar *currentCalendar;
@property (nonatomic , strong) NSArray *weekDayArray;
@property (nonatomic,strong) NSDate *currentDate;
@property (weak, nonatomic) UICollectionView *collectionview;
@property (weak, nonatomic) UILabel *titleLabel;
@property (nonatomic,strong) NSMutableArray *selectStauts;
@property (nonatomic, strong)CalenderCell *cell1;

@end

@implementation CalenderView

-(instancetype)initWithFrame:(CGRect)frame WithStr:(NSString *)dateStr
{   self = [super initWithFrame:frame];
    
    if(self){
        _currentDate = [self getLocalDate];
        _selectStauts = @[].mutableCopy;
        if (dateStr) {
            NSArray *arr = [dateStr componentsSeparatedByString:@"-"];
            self.currenter = [arr lastObject];
        }
        self.sendStr = dateStr;
        self.backgroundColor = [UIColor brownColor];
        
        UIView *titleView = [UIView new];
        titleView.frame = CGRectMake(0, 0, frame.size.width, 50);
        titleView.backgroundColor = [UIColor brownColor];
        [self addSubview:titleView];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:titleView.bounds];
        titleLabel.text = dateStr == nil ? [self stirngFromDate:_currentDate] : dateStr;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:20.f];
        [titleView addSubview:titleLabel];
        _titleLabel = titleLabel;
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.center = CGPointMake(25, titleLabel.center.y);
        leftBtn.bounds = CGRectMake(0, 0, 25, 25);
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"bt_previous"] forState:UIControlStateNormal];
        [titleView addSubview:leftBtn];
        [leftBtn addTarget:self action:@selector(previous) forControlEvents:UIControlEventTouchUpInside];

        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.center = CGPointMake(titleLabel.bounds.size.width - 25, titleLabel.center.y);
        rightBtn.bounds = CGRectMake(0, 0, 25, 25);
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"bt_next"] forState:UIControlStateNormal];
        [titleView addSubview:rightBtn];
        [rightBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat itemWidth = (frame.size.width-2) / 7;
        CGFloat itemHeight = (frame.size.height - 50-2) / 7;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(itemWidth, itemHeight);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(1, titleView.bounds.size.height+1, frame.size.width-2, frame.size.height - titleView.bounds.size.height-2) collectionViewLayout:layout];
        collectionview.backgroundColor = [UIColor whiteColor];
        [self addSubview:collectionview];
        [collectionview registerClass:[CalenderCell class] forCellWithReuseIdentifier:@"cell"];
        collectionview.dataSource = self;
        collectionview.delegate = self;
        collectionview.scrollEnabled = NO;
        collectionview.showsVerticalScrollIndicator = NO;
        _collectionview = collectionview;
    }
    return self;
}


#pragma mark - UICollectionView DataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
        return self.weekDayArray.count;
    }else{
        return 47;
    }
}

-(CalenderCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CalenderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.contentView setBackgroundColor:[UIColor clearColor]];
    [cell.contentView.layer setCornerRadius:10.f];
    if(indexPath.section == 0){
        cell.dateLabel.text = _weekDayArray[indexPath.row];
        cell.dateLabel.textColor = [UIColor colorWithHexString:@"#15cc9c"];
    }else{
        //一个月里所有的天数
        NSInteger daysInThisMonth = [self getDaysOfMonth];
        //一个月里的第一天是星期几
        NSInteger firstWeekday = [self getWeekOfDayOfMonth];
        NSInteger day = 0;
        
        //行数不大于第一天的星期数
        if (indexPath.row < firstWeekday) {
            [cell.dateLabel setText:@""];
            
        //行数大于第一天所在的星期数＋这个月的天数－1
        }else if (indexPath.row > firstWeekday + daysInThisMonth - 1){
            [cell.dateLabel setText:@""];
        }else{
            day = indexPath.row - firstWeekday + 1;
            [cell.dateLabel setText:[NSString stringWithFormat:@"%li",(long)day]];
            [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#6f6f6f"]];
            if (self.sendStr == nil ? day == [self getCurrentData] : YES && self.sendStr == nil ?  [_titleLabel.text isEqualToString:self.currentDateStr] : [self.currenter integerValue] == day) {
                 [cell.contentView setBackgroundColor:[UIColor redColor]];
                [cell.contentView.layer setCornerRadius:10.f];
                self.nowTime = day;
                self.cell1 = cell;
            }
        }
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        CalenderCell *cell = (CalenderCell *)[collectionView cellForItemAtIndexPath:indexPath];
        if(cell.dateLabel.text.length != 0){
            if (self.nowTime == [self getCurrentData]) {
                
                [self.cell1.contentView.layer setCornerRadius:10.f];
                [self.cell1.contentView setBackgroundColor:[UIColor clearColor]];
            }
            
            [cell.contentView.layer setCornerRadius:10.f];
            [cell.contentView setBackgroundColor:[UIColor redColor]];
            
            _currentDate = [self getSelcctData:_currentDate selctData:[cell.dateLabel.text integerValue]];
            _titleLabel.text = [self stirngFromDate:_currentDate];
        }
        
        //本类代理执行的方法
        if ([self.mDelegate respondsToSelector:@selector(itemClick:)]) {
            [self.mDelegate itemClick:self.titleLabel.text];
            
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalenderCell *deselectedCell = (CalenderCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(deselectedCell.dateLabel.text.length != 0){
        [deselectedCell.contentView.layer setCornerRadius:10.f];
        [deselectedCell.contentView setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma -mark btn事件
-(void)previous{
    self.isTrans = YES;
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void) {
        _currentDate = [self getPerviousMonth:_currentDate];
        _titleLabel.text = [self stirngFromDate:_currentDate];
        [_collectionview reloadData];
    } completion:nil];
}

-(void)next{
    self.isTrans = YES;
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void) {
        _currentDate = [self getNextMonth:_currentDate];
        _titleLabel.text = [self stirngFromDate:_currentDate];
        [_collectionview reloadData];
    }completion:nil];
}

#pragma mark - Get 初始化
-(NSCalendar *)currentCalendar{
    if(!_currentCalendar){
        _currentCalendar = [NSCalendar currentCalendar];
    }
    return _currentCalendar;
}

-(NSArray *)weekDayArray{
    _weekDayArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    return _weekDayArray;
}

/**
 *  取到北京时间
 *
 *  @return <#return value description#>
 */
-(NSDate *)getLocalDate{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    return localDate;
}

//获取这是当前的第几天
- (NSInteger )getCurrentData{
    NSDate *date = [self getLocalDate];
    NSString *str = date.description;
    NSArray *arr = [str componentsSeparatedByString:@" "];
    NSString *str1 = [arr firstObject];
    self.currentDateStr = self.sendStr == nil ? [NSString stringWithString:str1] : self.sendStr;
    NSArray *arr1 = [str1 componentsSeparatedByString:@"-"];
    NSString *str2 = [arr1 lastObject];
    NSInteger currentDate = [str2 integerValue];
    return currentDate;
}


//获取这是当前的第几天
- (NSDate * )getSelcctData:(NSDate *)date selctData:(NSInteger)selectData{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSString *str = date.description;
    NSArray *arr = [str componentsSeparatedByString:@" "];
    NSString *str1 = arr[0];
    self.currentDateStr = self.sendStr == nil ? [NSString stringWithString:str1] : self.sendStr;
//    self.currentDateStr = [NSString stringWithString:str1];
    NSArray *arr1 = [str1 componentsSeparatedByString:@"-"];
    NSString *str2 = [arr1 lastObject];
    NSInteger currentDate = [str2 integerValue];
    dateComponents.day = + (selectData - currentDate);
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

/**
 *  得到这个月的第一天
 *
 *  @return <#return value description#>
 */
-(NSDate *)getFirstDayOfCurrentMonth
{
    double interval = 0;
    NSDate *beginDate = nil;
    //    NSDate *endDate = nil;
    
    [self.currentCalendar setFirstWeekday:1];//设定周一为周首日
    BOOL ok = [self.currentCalendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:_currentDate];
    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
    if (ok) {
        //        endDate = [beginDate dateByAddingTimeInterval:interval-1];
    }else {
    }
    return beginDate;
}
/**
 *  得到这个月的第一天是星期几
 *
 *  @return <#return value description#>
 */
-(NSUInteger)getWeekOfDayOfMonth{
    NSUInteger weekCount = [self.currentCalendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:[self getFirstDayOfCurrentMonth]] - 1;
    return weekCount;
}

/**
 *  得到这个月的天数
 *
 *  @return <#return value description#>
 */
-(NSUInteger)getDaysOfMonth{
    NSUInteger daysCount = [self.currentCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:_currentDate].length;
    return daysCount;
}

/**
 *  得到这个月的周数
 *
 *  @return <#return value description#>
 */
-(NSUInteger)getWeeksOfMonth{
    NSUInteger weekDay = [self getWeekOfDayOfMonth];
    NSUInteger days = [self getDaysOfMonth];
    NSUInteger weeks = 0;
    
    if(weekDay > 1){
        weeks+=1;
        days-=(7-weekDay+1);
    }
    
    weeks+=days/7;
    weeks+=(days%7>0)?1:0;
    return weeks;
}

/**
 *  NSDate 转成字符串
 *
 *  @param wtime <#wtime description#>
 *
 *  @return <#return value description#>
 */
-(NSString *)stirngFromDate:(NSDate *)wtime{
    NSString *timeStr = wtime.description;
    NSArray *arr = [timeStr componentsSeparatedByString:@" "];
    NSString *tempStr = arr.firstObject;
    return tempStr;
}

/**
 *  下一个月
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
- (NSDate*)getNextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

/**
 *  上一个月
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
- (NSDate*)getPerviousMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
@end
