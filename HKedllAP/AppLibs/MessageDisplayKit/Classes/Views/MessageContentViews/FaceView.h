#import <UIKit/UIKit.h>
@interface FaceView:UIView<UIScrollViewDelegate>
{
	NSMutableArray            *_phraseArray;
    UIScrollView              *_sv;
    UIPageControl* _pc;
    BOOL pageControlIsChanging;
}

@property (nonatomic, assign) NSObject       *delegate;
@property (nonatomic, strong) NSMutableArray *faceArray;
@property (nonatomic, strong) NSMutableArray *imageArray;

@end
