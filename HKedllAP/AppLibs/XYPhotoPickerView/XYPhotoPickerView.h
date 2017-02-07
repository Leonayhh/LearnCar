//
//  XYPhotoPickerView.h
//  GangQinEJia
//
//  Created by ly on 15/12/17.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPhotoPickerModel.h"
#import "MLSelectPhotoAssets.h"
#import "MLSelectPhotoPickerAssetsViewController.h"
#import "MLSelectPhotoBrowserViewController.h"
#import "MLSelectPhotoNavigationViewController.h"

@protocol XYPhotoPickerViewItemDelegate <NSObject>

-(void)didDeletebtnClick:(NSInteger)index;

@end

@interface XYPhotoPickerViewItem : UICollectionViewCell
{
    UIButton *deleteBtn;
}
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,weak)id<XYPhotoPickerViewItemDelegate> delegate;
@property(nonatomic,assign)BOOL isAddImageIcon;
@property(nonatomic,strong)UIImageView *mImageView;

-(void)layout;
@end


@protocol XYPhotoPickerViewDelegate <NSObject>


-(void)didPhotoEdit:(NSArray *)images;//图片选择、删除啊等操作

@end


@interface XYPhotoPickerView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,XYPhotoPickerViewItemDelegate>
{
    CGFloat itemWidth;
    CGFloat itemheight;
    UIView *addItemView;
    UIButton *addItemBtn;
}
@property(nonatomic,weak)id<XYPhotoPickerViewDelegate> delegate;
@property(nonatomic,strong)UIImage *addImage;
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,assign)NSInteger limitRow;
@property(nonatomic,assign)NSInteger rowCount;//每行显示多少个
@property(nonatomic,assign)NSInteger count;//一共多少个
@property(nonatomic,assign)NSInteger limitCount;//限制显示的个数
@property(nonatomic,strong)UICollectionView *mCollectionView;


@end
