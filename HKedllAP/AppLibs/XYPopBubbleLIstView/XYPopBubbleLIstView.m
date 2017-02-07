

#import "XYPopBubbleLIstView.h"



@interface  XYPopBubbleLIstView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy) NSArray *selectData;
@property (nonatomic,copy) void(^action)(NSInteger index);
@property (nonatomic,copy) NSArray * imagesData;
@end



XYPopBubbleLIstView * backgroundView;
UITableView * tableView;

@implementation XYPopBubbleLIstView


- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

+ (void)addPellTableViewSelectWithWindowFrame:(CGRect)frame
                                   selectData:(NSArray *)selectData
                                       images:(NSArray *)images
                                       action:(void(^)(NSInteger index))action animated:(BOOL)animate
                                       backgroudColor:(UIColor *)bgColor
{
    if (backgroundView != nil) {
        [XYPopBubbleLIstView hiden];
    }
    UIWindow *win = [[[UIApplication sharedApplication] windows] firstObject];
    
    backgroundView = [[XYPopBubbleLIstView alloc] initWithFrame:win.bounds];
    backgroundView.action = action;
    backgroundView.imagesData = images ;
    backgroundView.selectData = selectData;
    backgroundView.backgroundColor = [UIColor clearColor];
    [win addSubview:backgroundView];
    
    // TAB
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(  [UIScreen mainScreen].bounds.size.width - 88 , 70.0 -  20.0 * selectData.count , frame.size.width, 40 * selectData.count) style:0];
    tableView.dataSource = backgroundView;
    tableView.delegate = backgroundView;
    tableView.backgroundColor=bgColor;
    tableView.separatorColor=[UIColor whiteColor];
    tableView.scrollEnabled=NO;
    tableView.layer.cornerRadius = 4.0f;
    // 定点
    tableView.layer.anchorPoint = CGPointMake(1.0, 0);
    tableView.transform =CGAffineTransformMakeScale(0.0001, 0.0001);
    
    tableView.rowHeight = 40;
    [win addSubview:tableView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundClick)];
    [backgroundView addGestureRecognizer:tap];
    backgroundView.action = action;
    backgroundView.selectData = selectData;

    if (animate == YES) {
        backgroundView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            backgroundView.alpha = 1;
           tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
           
        }];
    }
}
+ (void)tapBackgroundClick
{
    [XYPopBubbleLIstView hiden];
}
+ (void)hiden
{
    if (backgroundView != nil) {
        
        [UIView animateWithDuration:0.1 animations:^{
            tableView.transform = CGAffineTransformMakeScale(0.000001, 0.0001);
        } completion:^(BOOL finished) {
            [backgroundView removeFromSuperview];
            [tableView removeFromSuperview];
            tableView = nil;
            backgroundView = nil;
        }];
    }
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _selectData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"PellTableViewSelectIdentifier";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:Identifier];
        cell.textLabel.textColor=[UIColor whiteColor];
        cell.textLabel.font=[UIFont systemFontOfSize:14];
        cell.separatorInset=UIEdgeInsetsMake(cell.separatorInset.top, 0, cell.separatorInset.bottom, cell.separatorInset.right);
        cell.backgroundColor=[UIColor clearColor];
        UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
        view_bg.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        cell.selectedBackgroundView = view_bg;
    }
    cell.imageView.image = [UIImage imageNamed:DB_RELRES(self.imagesData[indexPath.row]) ];
    cell.textLabel.text = _selectData[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.action) {
        self.action(indexPath.row);
    }
    [XYPopBubbleLIstView hiden];
}

#pragma mark 绘制三角形
- (void)drawRect:(CGRect)rect

{
    
    
    // 设置背景色
    [tableView.backgroundColor set];
    //拿到当前视图准备好的画板
    CGContextRef  context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    
    CGContextMoveToPoint(context,
                         tableView.right-10, tableView.top);//设置起点
    
    CGContextAddLineToPoint(context,
                             tableView.right-15 ,  tableView.top-8);
    
    CGContextAddLineToPoint(context,
                            tableView.right-20, tableView.top);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [tableView.backgroundColor setFill];  //设置填充色
    
    [tableView.backgroundColor setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
    
    [self setNeedsDisplay];
}

@end
