//
//  JXEmoji.m
//  sjvodios
//
//  Created by jixiong on 13-7-9.
//
//

#import "JXEmoji.h"

@implementation JXEmoji
@synthesize maxWidth,faceHeight,faceWidth,offset;

#define BEGIN_FLAG @"["
#define END_FLAG @"]"



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if(_faceArray==nil)
        {
            _faceArray = [[NSMutableArray alloc]initWithObjects:@"[微笑]",@"[撇嘴]",@"[色]",@"[发呆]",@"[得意]",@"[流泪]",@"[害羞]",@"[闭嘴]",@"[睡]",@"[大哭]",
                          @"[尴尬]",@"[发怒]",@"[调皮]",@"[龇牙]",@"[惊讶]",@"[难过]",@"[严肃]",@"[冷汗]",@"[抓狂]",@"[吐]",@"[偷笑]",@"[可爱]",@"[白眼]",@"[傲慢]",
                          @"[饥饿]",@"[困]",@"[惊恐]",@"[流汗]",@"[憨笑]",@"[大兵]",@"[奋斗]",@"[咒骂]",@"[疑问]",@"[嘘]",@"[晕]",@"[折磨]",@"[衰]",@"[骷髅]",
                          @"[敲打]",@"[再见]",@"[擦汗]",@"[抠鼻]",@"[鼓掌]",@"[糗大了]",@"[坏笑]",@"[左哼哼]",@"[右哼哼]",@"[哈欠]",@"[鄙视]",@"[委屈]",@"[快哭了]",
                          @"[阴险]",@"[亲嘴]",@"[吓]",@"[可怜]",@"[菜刀]",@"[西瓜]",@"[啤酒]",@"[篮球]",@"[乒乓]",@"[咖啡]",@"[饭]",@"[猪头]",@"[玫瑰]",@"[凋谢]",
                          @"[示爱]",@"[爱心]",@"[心碎]",@"[蛋糕]",@"[闪电]",@"[炸弹]",@"[刀]",@"[足球]",@"[瓢虫]",@"[便便]",@"[拥抱]",@"[月亮]",@"[太阳]",@"[礼物]",
                          @"[强]",@"[弱]",@"[握手]",@"[胜利]",@"[抱拳]",@"[勾引]",@"[拳头]",@"[差劲]",@"[爱你]",@"[NO]",@"[OK]",@"[爱情]",@"[飞吻]",@"[跳跳]",@"[发抖]",@"[怄火]",@"[转圈]",@"[磕头]",@"[回头]",@"[跳绳]",@"[投降]",nil];

            
            _imageArray = [[NSMutableArray alloc] init];
            for (int i = 0;i<[_faceArray count];i++){
                NSString* s = [NSString stringWithFormat:@"f%03d.png",i+1];
                [_imageArray addObject:s];
            }
        }
        _data = [[NSMutableArray alloc] init];
        faceWidth  = 20;
        faceHeight = 20;
        _top       = 0;
        offset     = 0;
        maxWidth   = frame.size.width;

        self.numberOfLines = 0;
        self.lineBreakMode = NSLineBreakByWordWrapping;
        self.textAlignment = NSTextAlignmentLeft;
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)dealloc
{


}


-(void) drawRect:(CGRect)rect
{
    [self.textColor set];
    

    if( [_data count]==1)
    {
        if (![self.text hasPrefix:BEGIN_FLAG] && ![self.text hasSuffix:END_FLAG])
        {
        
            [super drawRect:rect];

            return;

        }
    }
    
    
    
	CGFloat upX=0;
	CGFloat upY=0;
//    NSLog(@"%f,%f,%f,%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    for (int i=0;i<[_data count];i++) {
        NSString *str=[_data objectAtIndex:i];
        
        
        int n = -1;
        
        if ([str hasPrefix:BEGIN_FLAG]&&[str hasSuffix:END_FLAG]) {
            n = (int)[_faceArray indexOfObject:str];
            if(n !=-1){
                NSString *imageName = [_imageArray objectAtIndex:n];
                UIImage *img=[UIImage imageNamed:imageName];
                [img drawInRect:CGRectMake(upX, upY+_top, faceWidth, faceHeight)];
                upX=faceWidth+upX;
                if (upX >= maxWidth-faceWidth)
                {
                    upY = upY + faceHeight;
                    upX = 0;
                }
//                NSLog(@"%@,%f,%f",str,upX,upY);
            }
        }
        
        if(n == -1){
            for (int j = 0; j < [str length]; j++) {
                NSString *temp = [str substringWithRange:NSMakeRange(j, 1)];
                if([temp isEqualToString:@"\n"]){
                    upY = upY + _size;
                    upX = 0; 
                }else{
                    CGSize size=[temp sizeWithFont:self.font constrainedToSize:CGSizeMake(_size, _size)];
                    [temp drawInRect:CGRectMake(upX, upY+_top, size.width, size.height) withFont:self.font];
                    upX=upX+size.width;
                    if (upX >= maxWidth-size.width)
                    {
                        upY = upY + size.height;
                        upX = 0;
                    }
                }
//                NSLog(@"%@,%f,%f",temp,upX,upY);
            }
        }
    }
}

-(void)getImageRange:(NSString*)message  array: (NSMutableArray*)array {
    NSRange range=[message rangeOfString: BEGIN_FLAG];
    NSRange range1=[message rangeOfString: END_FLAG];
    //判断当前字符串是否还有表情的标志。
    if (range.length>0 && range1.length>0) {
        if (range.location > 0) {
            [array addObject:[message substringToIndex:range.location]];
            [array addObject:[message substringWithRange:NSMakeRange(range.location, range1.location+1-range.location)]];
            NSString *str=[message substringFromIndex:range1.location+1];
            [self getImageRange:str array:array];
        }else {
            NSString *nextstr=[message substringWithRange:NSMakeRange(range.location, range1.location+1-range.location)];
            //排除文字是“”的
            if (![nextstr isEqualToString:@""]) {
                [array addObject:nextstr];
                NSString *str=[message substringFromIndex:range1.location+1];
                [self getImageRange:str array:array];
            }else {
                return;
            }
        }
        
    } else if (message != nil) {
        [array addObject:message];
    }
}

-(void) setText:(NSString *)text
{
    [super setText:text];
    
    [_data removeAllObjects];
    [self getImageRange:text array:_data];
    [_data removeObject:@""];
    
    _size      = self.font.pointSize;
    CGRect screenBounds=[UIScreen mainScreen].bounds;
    maxWidth   = screenBounds.size.width-130*ScreenWidthPrt+offset;
    
    
    CGFloat upX=0;
    CGFloat upY=_size;
    _top=0;
    BOOL isWidth=NO;
    if (_data) {
        for (int i=0;i<[_data count];i++) {
            NSString *str=[_data objectAtIndex:i];
            BOOL isFace = NO;

            if ([str hasPrefix:BEGIN_FLAG]&&[str hasSuffix:END_FLAG]) {
                isFace = [_faceArray indexOfObject:str] != NSNotFound;
                if(isFace){
                    upX=faceWidth+upX;
                    if (upX >= maxWidth-faceWidth)
                    {
                        upY = upY + faceHeight;
                        upX = 0;
                        isWidth = YES;

                    }
                }
            }
            
            if(!isFace)
            {
                for (int j = 0; j < [str length]; j++)
                {
                    NSString *temp = [str substringWithRange:NSMakeRange(j, 1)];
                    if([temp isEqualToString:@"\n"])
                    {
                        upY = upY + _size;
                        upX = 0;
                    }
                    else
                    {
                        CGSize size=[temp sizeWithFont:self.font constrainedToSize:CGSizeMake(_size, _size)];
                        upX=upX+size.width;
                        if (upX >= maxWidth-size.width)
                        {
                            upY = upY + size.height;
                            upX = 0;
                            isWidth = YES;
                        }
                    }
                }
            }
            
        }
    }
    
    


    if(upY<25){
        _top = (25-upY)/2;
//        NSLog(@"_top=%d/%d",_top,self.frame.size.height);
    }
    if(upY<_size)
        upY = _size;
    if(upY<25)
        upY = 25;
    if(isWidth){
        CGRect screenBounds=[UIScreen mainScreen].bounds;
        upX = screenBounds.size.width-130*ScreenWidthPrt+offset;
    }
    
    
    self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y, upX, upY); //@ 需要将该view的尺寸记下，方便以后使用
    //NSLog(@"%d,%.1f %.1f", [_data count], upX, upY);
    
    
}

@end
