//
//  XYPhotoPickerView.m
//  GangQinEJia
//
//  Created by ly on 15/12/17.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "XYPhotoPickerView.h"



@implementation XYPhotoPickerViewItem
@synthesize mImageView;
@synthesize isAddImageIcon;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        isAddImageIcon=YES;
        [self initSubView];
    }
    return self;
}

-(void)initSubView{
    mImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.width-10, self.height-10)];
    mImageView.contentMode=UIViewContentModeScaleAspectFill;
    mImageView.clipsToBounds=YES;
    mImageView.userInteractionEnabled=YES;
    [self addSubview:mImageView];
    
    deleteBtn=[[UIButton alloc] initWithFrame:CGRectMake(mImageView.width-20, 0, 20, 20)];
    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"delete_icon"] forState:0];
    [deleteBtn addTarget:self action:@selector(onItemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [mImageView addSubview:deleteBtn];
}
-(void)layout{
    if(isAddImageIcon){
        deleteBtn.hidden=YES;
    }else{
        deleteBtn.hidden=NO;
    }
}

-(void)onItemBtnClick:(UIButton *)btn{
    if([self.delegate respondsToSelector:@selector(didDeletebtnClick:)]){
        [self.delegate didDeletebtnClick:self.index];
    }
}
@end


@implementation XYPhotoPickerView
@synthesize mCollectionView;
@synthesize imageArray;
@synthesize rowCount;
@synthesize count;
@synthesize limitRow;
@synthesize addImage;
@synthesize limitCount;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        rowCount=4;
        limitRow=3;
        limitCount=9;
        itemWidth=self.width/rowCount;
        itemheight=itemWidth;
        imageArray=[NSMutableArray array];
        count=1;
        addImage=[UIImage imageNamed:@"addItem_icon"];
        self.backgroundColor=[UIColor whiteColor];
        [self initSubView];
    }
    return self;
}

-(void)initSubView{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    layout.footerReferenceSize=CGSizeMake(self.width,0);
    mCollectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.width, itemheight) collectionViewLayout:layout];
    [mCollectionView registerClass:[XYPhotoPickerViewItem class] forCellWithReuseIdentifier:@"cell"];
    mCollectionView.backgroundColor=[UIColor clearColor];
    mCollectionView.dataSource=self;
    mCollectionView.delegate=self;
    [self addSubview:mCollectionView];
    [self setHeight:mCollectionView.height];
}

#pragma mark UICollectionViewDelegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(itemWidth,itemheight);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSInteger sections =0;
    if(count%rowCount>0){
        sections =count/rowCount+1;
    }else{
        sections =count/rowCount;
    }
    if(count%rowCount!=0){
        if(section+1==sections){
            return count%rowCount;
        }
    }
    return rowCount;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(count==0){
        return 0;
    }
    if(count%rowCount>0){
        return count/rowCount+1;
    }else{
        return count/rowCount;
    }
}
//组的cell创建
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XYPhotoPickerViewItem *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger index=0;
    index=(rowCount*indexPath.section)+(indexPath.row);
    cell.index=index;
    cell.delegate=self;
    if(imageArray.count>=limitCount){//超过了最大个数
        XYPhotoPickerModel *pickerModel=imageArray[index];
        UIImage *image=pickerModel.thumbImage;
        [cell.mImageView setImage:image];
        cell.isAddImageIcon=NO;
    }else{//没超过最大个数
        if(index==count-1){
            [cell.mImageView setImage:addImage];
            cell.isAddImageIcon=YES;
        }else{
            XYPhotoPickerModel *pickerModel=imageArray[index];
            UIImage *image=pickerModel.thumbImage;
            [cell.mImageView setImage:image];
            cell.isAddImageIcon=NO;
        }
    }
    [cell layout];
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {0,0,0,0};
    return top;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger SelectIndex=indexPath.section*rowCount+indexPath.row;
    
    if(imageArray.count>=limitCount){//超过了最大个数
       
    }else{//没超过最大个数
        if(SelectIndex==count-1){//只有允许点击最后一个才有效
            UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"选择图片方式：" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"用户相册", nil];
            
            [sheet showInView:self];
        }
    }
}
#pragma mark- 删除选择
-(void)didDeletebtnClick:(NSInteger)index{
    [imageArray removeObjectAtIndex:index];
    [self reFreshPhototPicker];
}
#pragma actionsheet
-(void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex==0)
    {
        if(imageArray.count>limitCount){
            
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"最多只能上传%li",(long)limitCount] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }else{
            [self addPicEvent:UIImagePickerControllerSourceTypeCamera];
        }
        
    }
    if (buttonIndex==1)//选择相册图片
    {
        // 创建控制器
        MLSelectPhotoPickerViewController *pickerVc = [[MLSelectPhotoPickerViewController alloc] init];
        // 默认显示相册里面的内容SavePhotos
        // 默认最多能选9张图片
        pickerVc.maxCount = limitCount-imageArray.count;
        pickerVc.status = PickerViewShowStatusPhotoStream;
        [pickerVc showPickerVc:self.viewController];
        __weak typeof(self) weakSelf = self;
        pickerVc.callBack = ^(NSArray *assets){
            [imageArray addObjectsFromArray:assets];
            imageArray= [self reModelImageArray];
            //刷新
            [weakSelf reFreshPhototPicker];
            
        };
    }
}

#pragma mark-调用系统相机拍照
-(void) addPicEvent:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = sourceType;
    [self.viewController presentViewController:picker animated:YES completion:nil];
}
#pragma mark- 系统相机拍照Delegate
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    XYPhotoPickerModel *pickerModel=[[XYPhotoPickerModel alloc] init];
    pickerModel.originImage=image;
    pickerModel.thumbImage=[image scaleImageToScale:0.25];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [imageArray addObject:pickerModel];
    
    //刷新
    [self reFreshPhototPicker];
 }


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark-模型转换
-(NSMutableArray *)reModelImageArray{
    NSMutableArray *array=[NSMutableArray array];
    for (int i=0; i<imageArray.count; i++) {
        MLSelectPhotoAssets *asset=imageArray[i];
        XYPhotoPickerModel *photo=[[XYPhotoPickerModel alloc] init];
        photo.thumbImage=[asset thumbImage];
        photo.originImage=[asset originImage];
        [array addObject:photo];
    }
    return array;
}
#pragma mark-刷新PhototPicker
-(void)reFreshPhototPicker{
    if(imageArray.count>=limitCount){
        count=imageArray.count;
    }else{
        count=imageArray.count+1;
    }
    [mCollectionView reloadData];
    
    long currentRow=1;
    if(count%rowCount>0){
        currentRow =count/rowCount+1;
    }else{
        currentRow =count/rowCount;
    }
    
    
    if(currentRow*rowCount<=limitRow*rowCount){
        [mCollectionView setHeight:itemheight*currentRow];
        [self setHeight:mCollectionView.height];
    }else{
        [mCollectionView setHeight:limitRow*itemheight];
        [self setHeight:mCollectionView.height];
    }

    
    //滚动到底部
    [mCollectionView setContentOffset:CGPointMake(0,itemheight*currentRow-mCollectionView.height)animated:YES];
    
    if([self.delegate respondsToSelector:@selector(didPhotoEdit:)]){
        [self.delegate didPhotoEdit:[NSArray arrayWithArray:self.imageArray]];
    }
    
    
}

@end
