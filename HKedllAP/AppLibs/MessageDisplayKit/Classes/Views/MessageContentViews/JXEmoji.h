//
//  JXEmoji.h
//  sjvodios
//
//  Created by jixiong on 13-7-9.
//
//
#import "JXLabel.h"
#import <UIKit/UIKit.h>

@interface JXEmoji : JXLabel
{

    NSMutableArray *_data;
    int _top;
    int _size;
    
}

@property(nonatomic,assign)int faceHeight;
@property(nonatomic,assign)int faceWidth;
@property(nonatomic,assign)int maxWidth;
@property(nonatomic,assign)int offset;

@property(strong,nonatomic) NSMutableArray *faceArray;
@property(strong,nonatomic) NSMutableArray *imageArray;

-(void) setText:(NSString *)text;


@end
