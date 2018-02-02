//
//  HeadJumpViewController.m
//  YiShopkeeper
//
//  Created by  apple on 2017/11/28.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "HeadJumpViewController.h"
#import "TJLActionSheet.h"
#import "TJLImagePickerController.h"
#import "TJLGridCollectionCell.h"
#import "TJLCameraViewController.h"


static NSInteger kGridItemNumberOfColumns = 4;
static CGFloat kGridSpace = 4;
static CGFloat kCollectionItemHeight;
static CGSize kCollectionItemSize;
static CGSize kCollectionPhotoItemSize;

@interface HeadJumpViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionViews;
@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) NSArray *imageArrayid;
@property (strong, nonatomic) UILongPressGestureRecognizer *longPress;

@end

@implementation HeadJumpViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        kCollectionItemHeight = (kScreenWidth - (kGridItemNumberOfColumns + 1) * kGridSpace) / kGridItemNumberOfColumns;
        kCollectionItemSize = CGSizeMake(kCollectionItemHeight, kCollectionItemHeight);
        kCollectionPhotoItemSize = CGSizeMake(kCollectionItemHeight * 1.2, kCollectionItemHeight * 1.2);
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"照片选择";
    [self addPhotoButton];
    [self setCollectionViewDetail];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setData:) name:@"HeadJumpViewController" object:nil];
    if (self.imageAryS != nil) {
        
        NSMutableArray *Ary = [NSMutableArray array];
        NSMutableArray *Arys = [NSMutableArray array];

        for (int i = 0; i < self.imageAryS.count; i++) {
            
            
            [Ary addObject: [self imageFromURLString:[self.imageAryS[i] objectForKey:@"skillPicAdd"]]];
            [Arys addObject:[self.imageAryS[i]objectForKey:@"skillPicId"]];
            
        }
        
        self.imageArray = Ary;
        self.imageArrayid = Arys;
        [self.collectionViews reloadData];
    }
    
}

-(void)setData:(NSNotification *)notification{
    NSLog(@"dict - %@",notification.userInfo);
    self.imageArrayid = nil;
    self.imageArrayid = [notification object];
}

//移除需要观察的通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:@"HeadJumpViewController"];
}

- (void)addPhotoButton {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(30, kScreenHeight - 120, kScreenWidth - 60, 45)];
    [button setTitle:@"选择照片" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor ] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)buttonClicked:(UIButton *)sender {
    self.imageArray = nil;
    
    __weak typeof(self) weakSelf = self;
    
    TJLActionSheet *sheet = [[TJLActionSheet alloc] initWithTitle:nil buttonTitles:@[@"拍照", @"从相册选择"] redButtonIndex:2 clicked:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [[TJLImagePickerController sharedInstance] showCameraInController:self successBlock:^(UIImage *image) {
                weakSelf.imageArray = @[image];
                if (_block != nil) {
                    _block(image);
                }
                [weakSelf.collectionView reloadData];
            }];
        } else if (buttonIndex == 1) {
            [[TJLImagePickerController sharedInstance] showPickerInController:self total:[self.geren isEqualToString:@"jineng"]?4:1 successBlock:^(NSArray *imageArray) {
                weakSelf.imageArray = imageArray;
                if (imageArray.count < 2) {
                    if (_block != nil) {
                        _block(weakSelf.imageArray[0]);
                    }
                }else
                {
                    if (_blocks != nil) {
                        _blocks(weakSelf.imageArray);
                    }
                }
                
                [weakSelf.collectionView reloadData];
            }];
        }
    }];
    [sheet show];}

- (void)setCollectionViewDetail {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[TJLGridCollectionCell cellNib] forCellWithReuseIdentifier:[TJLGridCollectionCell cellIdentifier]];
    _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressMoving:)];
    [self.collectionView addGestureRecognizer:_longPress];
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --- Collection

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TJLGridCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:[TJLGridCollectionCell cellIdentifier] forIndexPath:indexPath];
    cell.checkImageView.hidden = YES;
    cell.btnDelete.hidden = YES;
    cell.gridImageView.image =  self.imageArray[indexPath.item];
    
    return cell;
}

- (UICollectionView *)collectionView {
    if (!self.collectionViews) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = kCollectionItemSize;
        layout.minimumLineSpacing = kGridSpace;
        layout.minimumInteritemSpacing = kGridSpace;
        layout.sectionInset = UIEdgeInsetsMake(kGridSpace, kGridSpace, kGridSpace, kGridSpace);
        self.collectionViews = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight / 2.0) collectionViewLayout:layout];
        self.collectionViews.backgroundColor = [UIColor clearColor];
        self.collectionViews.showsVerticalScrollIndicator = NO;
        [self.collectionViews setContentOffset:CGPointMake(0, (kCollectionItemHeight + kGridSpace) * (self.imageArray.count / 4)) animated:YES];
    }
    return self.collectionViews;
}

- (NSArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [[NSArray alloc] init];
    }
    return _imageArray;
}

- (NSArray *)imageArrayid {
    if (!_imageArrayid) {
        _imageArrayid = [[NSArray alloc] init];
    }
    return _imageArrayid;
}

- (void)lonePressMoving:    (UILongPressGestureRecognizer *)longPress
{
    switch (_longPress.state) {
        case UIGestureRecognizerStateBegan: {
            {
                NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[_longPress locationInView:self.collectionView]];
                // 找到当前的cell
                TJLGridCollectionCell *cell = (TJLGridCollectionCell *)[self.collectionView cellForItemAtIndexPath:selectIndexPath];
                // 定义cell的时候btn是隐藏的, 在这里设置为NO
                [cell.btnDelete setHidden:NO];
                
                cell.btnDelete.tag = selectIndexPath.item;
                
                //添加删除的点击事件
                [cell.btnDelete addTarget:self action:@selector(btnDelete:) forControlEvents:UIControlEventTouchUpInside];
                
                [_collectionViews beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:_longPress.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [self.collectionView endInteractiveMovement];
            break;
        }
        default: [self.collectionView cancelInteractiveMovement];
            break;
    }
}







#pragma mark---UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",self.imageArray[indexPath.item]);
}

#pragma mark---btn的删除cell事件

- (void)btnDelete:(UIButton *)btn{
    
    if (_imageArrayid.count == 0) {
        return;
    }
    //cell的隐藏删除设置
    NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[_longPress locationInView:self.collectionView]];
    // 找到当前的cell
    TJLGridCollectionCell *cell = (TJLGridCollectionCell *)[self.collectionView cellForItemAtIndexPath:selectIndexPath];
    cell.btnDelete.hidden = NO;
    //取出源item数据
    id objc = [self.imageArray objectAtIndex:btn.tag];
    NSMutableArray *mutAry =[NSMutableArray array];
    NSMutableArray *mutAryID =[NSMutableArray array];

    mutAry = [self.imageArray mutableCopy];
    mutAryID = [self.imageArrayid mutableCopy];
    //从资源数组中移除该数据
    [mutAry removeObject:objc];
    [self httpRequestskillPicId:[self.imageArrayid[btn.tag]integerValue]];
    [mutAryID removeObjectAtIndex:btn.tag];
    self.imageArray = mutAry;
    self.imageArrayid = mutAryID;
    [self.collectionView reloadData];
    
}


- (void)httpRequestskillPicId:(NSInteger)skillPicId
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/user/delete",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(skillPicId),@"skillPicId", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        if (result == 1) {
            [self showRightWithTitle:@"图片删除成功" autoCloseTime:2];
        }else
        {
            [self showErrorWithTitle:@"图片删除失败" autoCloseTime:2];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        [self showErrorWithTitle:@"图片删除失败" autoCloseTime:2];
    }];
}

- (UIImage *) imageFromURLString: (NSString *) urlstring
{
    // This call is synchronous and blocking
    
//    UIImageView *image = [[UIImageView alloc]init];
//    [image sd_setImageWithURL: [NSURL URLWithString:urlstring]];
    return [UIImage imageWithData:[NSData
                                   dataWithContentsOfURL:[NSURL URLWithString:urlstring]]];
}



@end
