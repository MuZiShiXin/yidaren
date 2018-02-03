//
//  gerenxinxiViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/14.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "gerenxinxiViewController.h"
#import "NicknameChangeViewController.h"
#import "HeadJumpViewController.h"
#import "PlaceholderTextView.h"
#import "UserInfoQueryModel.h"
#import "TJLActionSheet.h"
#import "TJLImagePickerController.h"
#import "XWScanImage.h"
#import "WorkTypeSViewController.h"
#import "UserInfo.h"
@interface gerenxinxiViewController ()
{
    UIToolbar *toolbar;
    UIView *BJview;
}


@property (strong, nonatomic) IBOutlet UIImageView *gerentouxiang;
@property (strong, nonatomic) IBOutlet UILabel *nichengLabel;
@property (strong, nonatomic) IBOutlet UILabel *xingbieLabel;
@property (strong, nonatomic) IBOutlet UILabel *gongzhongLabel;
@property (strong, nonatomic) IBOutlet UIImageView *zhaopianImageView;

@property (strong, nonatomic) IBOutlet UILabel *shenfenzhengxinxiLabel;

@property (strong, nonatomic) IBOutlet UIImageView *shenfenzhengImageView;
@property (strong, nonatomic) IBOutlet UILabel *jinengLabel;

@property (strong, nonatomic) IBOutlet UIView *BJView;


//@property (strong, nonatomic) NSArray *imageArray;

@property (nonatomic ,strong) NSMutableArray *imageAryId;

@property (nonatomic , strong) UserInfoQueryModel *UserInfoModel;
@property (nonatomic , strong) PlaceholderTextView *contentContactInformationTextView;

@property (strong, nonatomic) IBOutlet UILabel *darenjinengImage;

@property (nonatomic ,strong)UIButton *choosePictureButton;
@property (nonatomic ,strong)UIImageView *SkillsPicturesImageView;
@property (nonatomic ,strong)UIImageView *SkillsPicturesImageView1;
@property (nonatomic ,strong)UIImageView *SkillsPicturesImageView2;
@property (nonatomic ,strong)UIImageView *SkillsPicturesImageView3;
@property (nonatomic ,strong)UIButton    *SkillsPicturesBtn;
@property (nonatomic ,strong)UIButton    *SkillsPicturesBtn1;
@property (nonatomic ,strong)UIButton    *SkillsPicturesBtn2;
@property (nonatomic ,strong)UIButton    *SkillsPicturesBtn3;
@property (nonatomic ,strong)NSMutableArray *ImageAry;

@property (nonatomic ,strong)NSArray *WorkTypeAry;

@property (nonatomic ,strong)UIButton *but;

@end

@implementation gerenxinxiViewController

-(NSArray *)WorkTypeAry
{
    if (!_WorkTypeAry) {
        _WorkTypeAry = [NSArray array];
    }
    return _WorkTypeAry;
}

- (NSMutableArray *)imageAryId
{
    if (!_imageAryId) {
        _imageAryId = [NSMutableArray arrayWithObjects:@(1),@(2),@(3),@(4),nil];
    }
    return _imageAryId;
}

- (NSMutableArray *)ImageAry
{
    if (!_ImageAry) {
        _ImageAry = [NSMutableArray array];
    }
    return _ImageAry;
}

- (UIButton *)choosePictureButton
{
    if (!_choosePictureButton) {
        //选择图片
        self.choosePictureButton = [[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79)];
        [_choosePictureButton setImage:[UIImage imageNamed:@"yg_wdyj_nr_tb2"] forState:UIControlStateNormal];
        [_choosePictureButton addTarget:self action:@selector(choosePicture) forControlEvents:UIControlEventTouchUpInside];
        [_BJView addSubview:_choosePictureButton];
    }
    return _choosePictureButton;
}

- (UIImageView *)SkillsPicturesImageView
{
    if (!_SkillsPicturesImageView) {
        _SkillsPicturesImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79)];
        [_BJView addSubview:_SkillsPicturesImageView];
        
        self.SkillsPicturesBtn = [[UIButton alloc]initWithFrame:CGRectMake(79+10, CGRectGetMaxY(_darenjinengImage.frame), 20, 20)];
        _SkillsPicturesBtn.tag = 1020;
        [_SkillsPicturesBtn setTitle:@"X" forState:UIControlStateNormal];
        [_SkillsPicturesBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_SkillsPicturesBtn addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
        [_BJView addSubview:_SkillsPicturesBtn];
        
        _SkillsPicturesImageView.hidden = YES;
        _SkillsPicturesBtn.hidden = YES;
        //为UIImageView1添加点击事件
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scanBigImageClick:)];
        [_SkillsPicturesImageView addGestureRecognizer:tapGestureRecognizer];
        //让UIImageView和它的父类开启用户交互属性
        [_SkillsPicturesImageView setUserInteractionEnabled:YES];
    }
    return _SkillsPicturesImageView;
}



- (UIImageView *)SkillsPicturesImageView1
{
    if (!_SkillsPicturesImageView1) {
        _SkillsPicturesImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20 + 79 + 10 , CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79)];
        [_BJView addSubview:_SkillsPicturesImageView1];
        
        self.SkillsPicturesBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(79*2+20, CGRectGetMaxY(_darenjinengImage.frame), 20, 20)];
        _SkillsPicturesBtn1.tag = 1021;
        [_SkillsPicturesBtn1 setTitle:@"X" forState:UIControlStateNormal];
        [_SkillsPicturesBtn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_SkillsPicturesBtn1 addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
        [_BJView addSubview:_SkillsPicturesBtn1];
        _SkillsPicturesImageView1.hidden = YES;
        _SkillsPicturesBtn1.hidden = YES;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scanBigImageClick:)];
        [_SkillsPicturesImageView1 addGestureRecognizer:tapGestureRecognizer];
        //让UIImageView和它的父类开启用户交互属性
        [_SkillsPicturesImageView1 setUserInteractionEnabled:YES];
    }
    return _SkillsPicturesImageView1;
}


- (UIImageView *)SkillsPicturesImageView2
{
    if (!_SkillsPicturesImageView2) {
        _SkillsPicturesImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(20 + 79 * 2 + 20, CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79)];
        [_BJView addSubview:_SkillsPicturesImageView2];
        
        self.SkillsPicturesBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(20+79*3+10, CGRectGetMaxY(_darenjinengImage.frame), 20, 20)];
        _SkillsPicturesBtn2.tag = 1022;
        [_SkillsPicturesBtn2 setTitle:@"X" forState:UIControlStateNormal];
        [_SkillsPicturesBtn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_SkillsPicturesBtn2 addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
        [_BJView addSubview:_SkillsPicturesBtn2];
        
        _SkillsPicturesImageView2.hidden = YES;
        _SkillsPicturesBtn2.hidden = YES;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scanBigImageClick:)];
        [_SkillsPicturesImageView2 addGestureRecognizer:tapGestureRecognizer];
        //让UIImageView和它的父类开启用户交互属性
        [_SkillsPicturesImageView2 setUserInteractionEnabled:YES];
    }
    return _SkillsPicturesImageView2;
}



- (UIImageView *)SkillsPicturesImageView3
{
    if (!_SkillsPicturesImageView3) {
        _SkillsPicturesImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(20 + 79 * 3 + 30, CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79)];
        [_BJView addSubview:_SkillsPicturesImageView3];
        
        self.SkillsPicturesBtn3 = [[UIButton alloc]initWithFrame:CGRectMake(79*4+40, CGRectGetMaxY(_darenjinengImage.frame), 20, 20)];
        _SkillsPicturesBtn3.tag = 1023;
        [_SkillsPicturesBtn3 setTitle:@"X" forState:UIControlStateNormal];
        [_SkillsPicturesBtn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_SkillsPicturesBtn3 addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
        [_BJView addSubview:_SkillsPicturesBtn3];
        _SkillsPicturesImageView3.hidden = YES;
        _SkillsPicturesBtn3.hidden = YES;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scanBigImageClick:)];
        [_SkillsPicturesImageView3 addGestureRecognizer:tapGestureRecognizer];
        //让UIImageView和它的父类开启用户交互属性
        [_SkillsPicturesImageView3 setUserInteractionEnabled:YES];
    }
    return _SkillsPicturesImageView3;
}


- (void)viewDidAppear:(BOOL)animated
{
    id traget = self.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:traget action:nil];
    [self.view addGestureRecognizer:pan];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self.WanShanXinXi isEqualToString:@"完善信息"]) {
        self.isShowLiftBack = NO;
        self.but.hidden = NO;
    }
}

- (void)httpRequest
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MySelfInfo/selMySelfInfo",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        NSDictionary *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
        if (result == 1) {
            self.UserInfoModel = [UserInfoQueryModel creatRankingTotalModelWith:resultDic];
            [_gerentouxiang sd_setImageWithURL:[NSURL URLWithString:self.UserInfoModel.headPicAdd]placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp3"]];
            [_nichengLabel setText:self.UserInfoModel.nick];
            [_xingbieLabel setText:self.UserInfoModel.gender];
            [_gongzhongLabel setText:self.UserInfoModel.workType];
            [_zhaopianImageView sd_setImageWithURL:[NSURL URLWithString:self.UserInfoModel.picAdd]placeholderImage:[UIImage imageNamed:@"yg_wd_grqy_nr_tp2"]];
            [_shenfenzhengxinxiLabel setText:self.UserInfoModel.idNum];
            [_shenfenzhengImageView sd_setImageWithURL:[NSURL URLWithString:self.UserInfoModel.idPicAdd] placeholderImage:[UIImage imageNamed:@"yg_wd_grqy_nr_tp2"]];
            [_contentContactInformationTextView setText:self.UserInfoModel.skill];
            NSMutableArray *Ary = [NSMutableArray array];
            for (int i = 0; i <self.UserInfoModel.skillPics.count; i++) {
                NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:[self.UserInfoModel.skillPics[i] objectForKey:@"skillPicAdd"]]];
                if (data != nil) {
                    UIImage *image = [UIImage imageWithData:data]; // 取得图片
                    [Ary addObject:image];
                    [self.imageAryId replaceObjectAtIndex:i withObject:[self.UserInfoModel.skillPics[i] objectForKey:@"skillPicId"]];
                }
            }
            [self.ImageAry addObjectsFromArray:[Ary mutableCopy]];
            [self SetImageViewWithImage:self.ImageAry];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        
    }];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self httpRequest];
    [self httpRequests];

    
    
    
    _gerentouxiang.layer.cornerRadius = _gerentouxiang.frame.size.width / 2;
    //将多余的部分切掉
    _gerentouxiang.layer.masksToBounds = YES;
    
    if ([self.WanShanXinXi isEqualToString:@"完善信息"]) {
        self.title = @"请完善个人信息";
        self.but = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _but.frame =CGRectMake( 15, 20, 60, 44);
        [_but setTitle:@"返回"forState:UIControlStateNormal];
        [_but setTitleColor:[UIColor hx_colorWithHexRGBAString:kBlueColor] forState:UIControlStateNormal];
        [_but addTarget:self action:@selector(blackBtn:)forControlEvents:UIControlEventTouchUpInside];
        [self.navigationController.view addSubview:_but];
    }else
    {
        self.title = @"个人信息";
    }
    
    
    _contentContactInformationTextView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.jinengLabel.frame)+10, kScreenWidth - 30, 115)];
    _contentContactInformationTextView.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"f8f8f8"];
    _contentContactInformationTextView.placeholderLabel.font = [UIFont systemFontOfSize:15];
    _contentContactInformationTextView.placeholder = @"请输入技能...";
    _contentContactInformationTextView.font = [UIFont systemFontOfSize:15];
    _contentContactInformationTextView.maxLength = 200;
    [self.BJView addSubview:_contentContactInformationTextView];
    
    [_contentContactInformationTextView didChangeText:^(PlaceholderTextView *textView) {
        NSLog(@"%@",textView.text);
        
    }];
    __block __typeof(self) weakSelf = self;
    [_contentContactInformationTextView setBlock:^(NSString *str) {
        [weakSelf httpRequest:str ChanShu:@"jiNeng"];
    }];
    
    [self choosePictureButton];
    [self SkillsPicturesImageView];
    [self SkillsPicturesImageView1];
    [self SkillsPicturesImageView2];
    [self SkillsPicturesImageView3];
    [self SkillsPicturesBtn];
    [self SkillsPicturesBtn1];
    [self SkillsPicturesBtn2];
    [self SkillsPicturesBtn3];
}

- (void)httpRequests
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/GZ/fenlei/select",kPRTURL];
    [BaseHttpTool GET:urlStr params:nil success:^(id  _Nullable responseObj) {
        self.WorkTypeAry = [responseObj objectForKey:@"data"];
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        
    }];
}

- (void)blackBtn:(UIButton *)btn
{
    NSString *str = @"";
    if (userManager.curUserInfo.wanShanXinXi == 1) {
        str = @"信息以完善,是否进入首页";
    }else
    {
        str = @"信息未完善,点击确定将退出当前登录";
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                         message:str
                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action) {
            //响应事件
        NSLog(@"action = %@", action);
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action) {
        //响应事件
        NSLog(@"action = %@", action);
        if (userManager.curUserInfo.wanShanXinXi == 0) {
            [self.but removeAllSubviews];
            [userManager logout:nil];
        }else
        {
            [self.but removeAllSubviews];
            [self.navigationController popViewControllerAnimated:YES];
        }
                                                             
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)genggaitouxiangLabel {
    DLog(@"点击头像");
//    HeadJumpViewController *HeadJumpVC = [[HeadJumpViewController alloc]init];
//    HeadJumpVC.geren = @"SB";
//    HeadJumpVC.Images = _gerentouxiang.image;
//    __block __typeof(self) weakSelf = self;
//    [HeadJumpVC setBlock:^(UIImage *image)
//     {
//         [weakSelf.gerentouxiang setImage:image];
//         NSData *data = [self zipNSDataWithImage:image];
//         NSString *imagestr = [BaseHttpTool typeForImageData:data];
//         NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//         [weakSelf httpRequest:1 headPic:encodedImageStr picName:imagestr];
//
//     }];
//    [self.navigationController pushViewController:HeadJumpVC animated:YES];
    
    __block __typeof(self) weakSelf = self;
    TJLActionSheet *sheet = [[TJLActionSheet alloc] initWithTitle:nil buttonTitles:@[@"拍照", @"从相册选择"] redButtonIndex:2 clicked:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [[TJLImagePickerController sharedInstance] showCameraInController:self successBlock:^(UIImage *image) {
                weakSelf.gerentouxiang.image = image;
                NSData *data = [self zipNSDataWithImage:image];
                NSString *imagestr = [BaseHttpTool typeForImageData:data];
                NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                [weakSelf httpRequest:1 headPic:encodedImageStr picName:imagestr];
            }];
        } else if (buttonIndex == 1) {
            [[TJLImagePickerController sharedInstance] showPickerInController:self total:1  successBlock:^(NSArray *imageArray) {
                [weakSelf.gerentouxiang setImage:imageArray[0]];
                NSData *data = [self zipNSDataWithImage:imageArray[0]];
                NSString *imagestr = [BaseHttpTool typeForImageData:data];
                NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                [weakSelf httpRequest:1 headPic:encodedImageStr picName:imagestr];
            }];
        }
    }];
    [sheet show];
    
    
    
    
    
}

#pragma mark 昵称
- (IBAction)nichengxuanze {
    NSLog(@"昵称");
    NicknameChangeViewController *NicknameChangeVC = [[NicknameChangeViewController alloc]init];
    NicknameChangeVC.BiaoTiTitleLabelText = @"昵称";
    self.but.hidden = YES;
    __block __typeof(self) weakSelf = self;
    [NicknameChangeVC setBlock:^(NSString *Str)
     {
         [weakSelf.nichengLabel setText:Str];
         [self httpRequest:Str ChanShu:@"nick"];
     }];
    [self.navigationController pushViewController:NicknameChangeVC animated:YES];
}

#pragma mark 性别
- (IBAction)xingbiexuanze {
    NSLog(@"性别");
    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight-136)];
    //样式
    toolbar.barStyle = UIBarStyleBlackTranslucent;//半透明
    //透明度
    toolbar.alpha = 0.5f;
    [self.view addSubview:toolbar];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [toolbar addGestureRecognizer:tapGestureRecognizer];
    
    
    BJview
    = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-136-64, kScreenWidth, 136)];
    BJview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:BJview];
    
    UIButton *quxiaobutton = [[UIButton alloc]initWithFrame:CGRectMake(15, 0, 40, 45)];
    [quxiaobutton setTitle:@"取消" forState:(UIControlStateNormal)];
    [quxiaobutton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"666666"] forState:(UIControlStateNormal)];
    quxiaobutton.titleLabel.font = [UIFont systemFontOfSize:15];
    [quxiaobutton addTarget:self action:@selector(quxiaobutton) forControlEvents:(UIControlEventTouchUpInside)];
    [BJview addSubview:quxiaobutton];
    
    UILabel *biaotiLabel = [[UILabel alloc]initWithFrame:CGRectMake((BJview.mj_w-200)/2, 15, 200, 15)];
    biaotiLabel.text = @"性别选择";
    biaotiLabel.font = [UIFont systemFontOfSize:15];
    biaotiLabel.textColor = [UIColor blackColor];
    biaotiLabel.textAlignment = 1;
    [BJview addSubview:biaotiLabel];
    
    
    UIButton *quedingbutton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-55, 0, 40, 45)];
    [quedingbutton setTitle:@"完成" forState:(UIControlStateNormal)];
    [quedingbutton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"27b8f3"] forState:(UIControlStateNormal)];
    quedingbutton.titleLabel.font = [UIFont systemFontOfSize:15];
    [quedingbutton addTarget:self action:@selector(quedingbutton) forControlEvents:(UIControlEventTouchUpInside)];
    [BJview addSubview:quedingbutton];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(quedingbutton.frame), kScreenWidth, 1)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [BJview addSubview:lineView];
    
    UIButton *nanButton = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lineView.frame), kScreenWidth, 45)];
    [nanButton setTitle:@"男" forState:UIControlStateNormal];
    nanButton.titleLabel.font = [UIFont systemFontOfSize:15];
    
    if ([_xingbieLabel.text isEqualToString:@"男"]||[_xingbieLabel.text isEqualToString:@""]) {
        [nanButton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"27b8f3"] forState:(UIControlStateNormal)];
    }else if ([_xingbieLabel.text isEqualToString:@"女"])
    {
       [nanButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    
    nanButton.tag = 1200;
    [nanButton addTarget:self action:@selector(nanAndnv:) forControlEvents:UIControlEventTouchUpInside];
    [BJview addSubview:nanButton];
    
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nanButton.frame), kScreenWidth, 1)];
    lineView1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [BJview addSubview:lineView1];
    
    UIButton *nvButton = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lineView1.frame), kScreenWidth, 45)];
    [nvButton setTitle:@"女" forState:UIControlStateNormal];
    nvButton.titleLabel.font = [UIFont systemFontOfSize:15];
    
    if ([_xingbieLabel.text isEqualToString:@"女"]) {
        [nvButton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"27b8f3"] forState:(UIControlStateNormal)];
    }else if ([_xingbieLabel.text isEqualToString:@"男"]||[_xingbieLabel.text isEqualToString:@""])
    {
        [nvButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    nvButton.tag = 1201;
    [nvButton addTarget:self action:@selector(nanAndnv:) forControlEvents:UIControlEventTouchUpInside];
    [BJview addSubview:nvButton];
    
    
    
}

#pragma mark 工种
- (IBAction)gongzhongxuanzeSButton {
    DLog(@"工种");
    __weak typeof (self)weakself = self;
    WorkTypeSViewController *WorkTypeSVC = [[WorkTypeSViewController alloc]init];
    self.but.hidden = YES;

    WorkTypeSVC.WorkTypeDate = _WorkTypeAry;
    [WorkTypeSVC setBlock:^(NSString *Str) {
        weakself.gongzhongLabel.text = Str;
        [self httpRequest:Str ChanShu:@"gongZhong"];
    }];
    [self.navigationController pushViewController:WorkTypeSVC animated:YES];
    
    
}



-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [toolbar removeFromSuperview];
    [BJview removeFromSuperview];
}



#pragma mark 取消
- (void)quxiaobutton
{
    NSLog(@"取消");
    [toolbar removeFromSuperview];
    [BJview removeFromSuperview];
    
}

#pragma mark 确定
- (void)quedingbutton
{
    NSLog(@"确定");
    [toolbar removeFromSuperview];
    [BJview removeFromSuperview];
    if ([_xingbieLabel.text isEqualToString:@""]) {
        _xingbieLabel.text = @"男";
        [self httpRequest:_xingbieLabel.text ChanShu:@"gender"];
    }else
    {
        [self httpRequest:_xingbieLabel.text ChanShu:@"gender"];
    }
}


#pragma mark 男/女
- (void)nanAndnv:(UIButton *)btn
{
    NSLog(@"男/女");
    UIButton * button = (UIButton *)[self.view viewWithTag:1200];
    UIButton * button1 = (UIButton *)[self.view viewWithTag:1201];
    if (btn.tag == 1200) {
        [button setTitleColor:[UIColor hx_colorWithHexRGBAString:@"27b8f3"] forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_xingbieLabel setText:@"男"];
    }else
    {
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor hx_colorWithHexRGBAString:@"27b8f3"] forState:UIControlStateNormal];
        [_xingbieLabel setText:@"女"];

    }
    
}



#pragma mark 照片
- (IBAction)zhaopianxuanze {
    NSLog(@"照片");
//    HeadJumpViewController *HeadJumpVC = [[HeadJumpViewController alloc]init];
//    HeadJumpVC.geren = @"SB";
//    HeadJumpVC.Images = _zhaopianImageView.image;
//    __block __typeof(self) weakSelf = self;
//    [HeadJumpVC setBlock:^(UIImage *image)
//     {
//         [weakSelf.zhaopianImageView setImage:image];
//         NSData *data = [self zipNSDataWithImage:image];
//         NSString *imagestr = [BaseHttpTool typeForImageData:data];
//         NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//         [weakSelf httpRequest:2 headPic:encodedImageStr picName:imagestr];
//     }];
//    [self.navigationController pushViewController:HeadJumpVC animated:YES];
    
    __weak typeof(self) weakSelf = self;
    TJLActionSheet *sheet = [[TJLActionSheet alloc] initWithTitle:nil buttonTitles:@[@"拍照", @"从相册选择"] redButtonIndex:2 clicked:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [[TJLImagePickerController sharedInstance] showCameraInController:self successBlock:^(UIImage *image) {
                [weakSelf.zhaopianImageView setImage:image];
                NSData *data = [self zipNSDataWithImage:image];
                NSString *imagestr = [BaseHttpTool typeForImageData:data];
                NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                [weakSelf httpRequest:2 headPic:encodedImageStr picName:imagestr];
            }];
        } else if (buttonIndex == 1) {
            [[TJLImagePickerController sharedInstance] showPickerInController:self total:1  successBlock:^(NSArray *imageArray) {
                [weakSelf.zhaopianImageView setImage:imageArray[0]];
                NSData *data = [self zipNSDataWithImage:imageArray[0]];
                NSString *imagestr = [BaseHttpTool typeForImageData:data];
                NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                [weakSelf httpRequest:2 headPic:encodedImageStr picName:imagestr];
            }];
        }
    }];
    [sheet show];
    
    
}
#pragma mark 身份证信息
- (IBAction)shenfenzhengxinxi {
    NSLog(@"身份证信息");
    NicknameChangeViewController *NicknameChangeVC = [[NicknameChangeViewController alloc]init];
    self.but.hidden = YES;
    NicknameChangeVC.BiaoTiTitleLabelText = @"身份证号";
    __block __typeof(self) weakSelf = self;
    [NicknameChangeVC setBlock:^(NSString *Str)
     {
         [weakSelf.shenfenzhengxinxiLabel setText:Str];
         [self httpRequest:Str ChanShu:@"idNum"];
     }];
    [self.navigationController pushViewController:NicknameChangeVC animated:YES];
}
#pragma mark 身份证图片
- (IBAction)shenfenzhengxuanze {
    DLog(@"身份证图片");
//    HeadJumpViewController *HeadJumpVC = [[HeadJumpViewController alloc]init];
//    HeadJumpVC.geren = @"SB";
//    HeadJumpVC.Images = _shenfenzhengImageView.image;
//    __block __typeof(self) weakSelf = self;
//    [HeadJumpVC setBlock:^(UIImage *image)
//     {
//         [weakSelf.shenfenzhengImageView setImage:image];
//          NSData *data = [self zipNSDataWithImage:image];
//         NSString *imagestr = [BaseHttpTool typeForImageData:data];
//         NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//         [weakSelf httpRequest:3 headPic:encodedImageStr picName:imagestr];
//     }];
//    [self.navigationController pushViewController:HeadJumpVC animated:YES];
    
    __weak typeof(self) weakSelf = self;
    TJLActionSheet *sheet = [[TJLActionSheet alloc] initWithTitle:nil buttonTitles:@[@"拍照", @"从相册选择"] redButtonIndex:2 clicked:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [[TJLImagePickerController sharedInstance] showCameraInController:self successBlock:^(UIImage *image) {
                [weakSelf.shenfenzhengImageView setImage:image];
                NSData *data = [self zipNSDataWithImage:image];
                NSString *imagestr = [BaseHttpTool typeForImageData:data];
                NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                [weakSelf httpRequest:3 headPic:encodedImageStr picName:imagestr];
            }];
        } else if (buttonIndex == 1) {
            [[TJLImagePickerController sharedInstance] showPickerInController:self total:1  successBlock:^(NSArray *imageArray) {
                [weakSelf.shenfenzhengImageView setImage:imageArray[0]];
                NSData *data = [self zipNSDataWithImage:imageArray[0]];
                NSString *imagestr = [BaseHttpTool typeForImageData:data];
                NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                [weakSelf httpRequest:3 headPic:encodedImageStr picName:imagestr];
            }];
        }
    }];
    [sheet show];
    
    
}


- (void)choosePicture {
    DLog(@"技能图片");
//    HeadJumpViewController *HeadJumpVC = [[HeadJumpViewController alloc]init];
//    HeadJumpVC.Images = _zhaopianImageView.image;
//    HeadJumpVC.geren = @"jineng";
//    HeadJumpVC.imageAryS = self.UserInfoModel.skillPics;
//    __block __typeof(self) weakSelf = self;
//    [HeadJumpVC setBlocks:^(NSArray *ImageArys) {
//        [_jinengzhaopianImageView setImage:ImageArys[0]];
//        for (int i = 0; i < ImageArys.count; i++) {
////             UIImageJPEGRepresentation(ImageArys[i], 1.0f);
//            NSData *data = [self zipNSDataWithImage:ImageArys[i]];
//            NSString *imagestr = [BaseHttpTool typeForImageData:data];
//            NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//            [weakSelf httpRequest:4 headPic:encodedImageStr picName:imagestr Index:i];
//        }
//    }];
//    [self.navigationController pushViewController:HeadJumpVC animated:YES];
    __weak typeof(self) weakSelf = self;
    TJLActionSheet *sheet = [[TJLActionSheet alloc] initWithTitle:nil buttonTitles:@[@"拍照", @"从相册选择"] redButtonIndex:2 clicked:^(NSInteger buttonIndex) {
        if (buttonIndex == 0 && weakSelf.ImageAry.count < 4) {
            [[TJLImagePickerController sharedInstance] showCameraInController:self successBlock:^(UIImage *image) {
                [weakSelf.ImageAry addObject:image];
                [weakSelf SetImageViewWithImage:weakSelf.ImageAry];
                NSData *data = [weakSelf zipNSDataWithImage:image];
                NSString *imagestr = [BaseHttpTool typeForImageData:data];
                NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                [weakSelf httpRequest:4 headPic:encodedImageStr picName:imagestr Index:weakSelf.ImageAry.count];
                [weakSelf.ImageAry addObject:image];

            }];
        } else if (buttonIndex == 1) {
            [[TJLImagePickerController sharedInstance] showPickerInController:self total:4-self.ImageAry.count successBlock:^(NSArray *imageArray) {
                
                
                for (int i = 0; i < imageArray.count; i++) {
                        NSData *data = [self zipNSDataWithImage:imageArray[i]];
                        NSString *imagestr = [BaseHttpTool typeForImageData:data];
                        NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                    if (weakSelf.ImageAry.count == 0) {
                       [weakSelf httpRequest:4 headPic:encodedImageStr picName:imagestr Index:i];
                    }else
                    {
                       [weakSelf httpRequest:4 headPic:encodedImageStr picName:imagestr Index:i + self.ImageAry.count];
                    }
                }
                
                [weakSelf.ImageAry addObjectsFromArray:imageArray.mutableCopy];
                [weakSelf SetImageViewWithImage:weakSelf.ImageAry];
            }];
        }
    }];
    [sheet show];
    
}

-(void)SetImageViewWithImage:(NSMutableArray *)Ary
{
    if (Ary.count == 0) {
        _SkillsPicturesImageView.hidden = YES;
        _SkillsPicturesImageView1.hidden = YES;
        _SkillsPicturesImageView2.hidden = YES;
        _SkillsPicturesImageView3.hidden = YES;
        _SkillsPicturesBtn.hidden = YES;
        _SkillsPicturesBtn1.hidden = YES;
        _SkillsPicturesBtn2.hidden = YES;
        _SkillsPicturesBtn3.hidden = YES;
        _choosePictureButton.hidden = NO;
        self.choosePictureButton.frame = CGRectMake(20, CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79);
    }else if (Ary.count == 1)
    {
        _SkillsPicturesImageView.hidden = NO;
        _SkillsPicturesImageView1.hidden = YES;
        _SkillsPicturesImageView2.hidden = YES;
        _SkillsPicturesImageView3.hidden = YES;
        _SkillsPicturesBtn.hidden = NO;
        _SkillsPicturesBtn1.hidden = YES;
        _SkillsPicturesBtn2.hidden = YES;
        _SkillsPicturesBtn3.hidden = YES;
        _choosePictureButton.hidden = NO;
        [self.SkillsPicturesImageView setImage:Ary[0]];
        self.choosePictureButton.frame = CGRectMake(20 + 79 + 10, CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79);
        
        
    }else if (Ary.count == 2)
    {
        _SkillsPicturesImageView.hidden = NO;
        _SkillsPicturesImageView1.hidden = NO;
        _SkillsPicturesImageView2.hidden = YES;
        _SkillsPicturesImageView3.hidden = YES;
        _SkillsPicturesBtn.hidden = NO;
        _SkillsPicturesBtn1.hidden = NO;
        _SkillsPicturesBtn2.hidden = YES;
        _SkillsPicturesBtn3.hidden = YES;
        _choosePictureButton.hidden = NO;
        [self.SkillsPicturesImageView setImage:Ary[0]];
        [self.SkillsPicturesImageView1 setImage:Ary[1]];
        self.choosePictureButton.frame = CGRectMake(20 + 79*2 + 20, CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79);
    }else if (Ary.count == 3)
    {
        _SkillsPicturesImageView.hidden = NO;
        _SkillsPicturesImageView1.hidden = NO;
        _SkillsPicturesImageView2.hidden = NO;
        _SkillsPicturesImageView3.hidden = YES;
        _SkillsPicturesBtn.hidden = NO;
        _SkillsPicturesBtn1.hidden = NO;
        _SkillsPicturesBtn2.hidden = NO;
        _SkillsPicturesBtn3.hidden = YES;
        _choosePictureButton.hidden = NO;
        [self.SkillsPicturesImageView setImage:Ary[0]];
        [self.SkillsPicturesImageView1 setImage:Ary[1]];
        [self.SkillsPicturesImageView2 setImage:Ary[2]];
        self.choosePictureButton.frame = CGRectMake(20 + 79*3 + 30, CGRectGetMaxY(_darenjinengImage.frame)+10, 79, 79);
    }else if (Ary.count == 4)
    {
        _SkillsPicturesImageView.hidden = NO;
        _SkillsPicturesImageView1.hidden = NO;
        _SkillsPicturesImageView2.hidden = NO;
        _SkillsPicturesImageView3.hidden = NO;
        _SkillsPicturesBtn.hidden = NO;
        _SkillsPicturesBtn1.hidden = NO;
        _SkillsPicturesBtn2.hidden = NO;
        _SkillsPicturesBtn3.hidden = NO;
        _choosePictureButton.hidden = YES;
        [self.SkillsPicturesImageView setImage:Ary[0]];
        [self.SkillsPicturesImageView1 setImage:Ary[1]];
        [self.SkillsPicturesImageView2 setImage:Ary[2]];
        [self.SkillsPicturesImageView3 setImage:Ary[3]];
    }
}

- (void)deleteImage:(UIButton *)Btn
{
//    self.UserInfoModel.skillPics[0];

    if (Btn.tag == 1020) {
        [self httpRequestskillPicId:[self.imageAryId[0] integerValue]];
        [self.ImageAry removeObjectAtIndex:0];
//        [self.imageAryId removeObjectAtIndex:0];
        [self.imageAryId replaceObjectAtIndex:0 withObject:@(0)];
        [self SetImageViewWithImage:self.ImageAry];
        
    }else if (Btn.tag == 1021)
    {
        [self httpRequestskillPicId:[self.imageAryId[1] integerValue]];
        [self.ImageAry removeObjectAtIndex:1];
//        [self.imageAryId removeObjectAtIndex:1];
        [self.imageAryId replaceObjectAtIndex:1 withObject:@(1)];
        [self SetImageViewWithImage:self.ImageAry];
    }else if (Btn.tag == 1022)
    {
        [self httpRequestskillPicId:[self.imageAryId[2] integerValue]];
        [self.ImageAry removeObjectAtIndex:2];
//        [self.imageAryId removeObjectAtIndex:2];
        [self.imageAryId replaceObjectAtIndex:2 withObject:@(2)];

        [self SetImageViewWithImage:self.ImageAry];
        
    }else if (Btn.tag == 1023)
    {
        [self httpRequestskillPicId:[self.imageAryId[3] integerValue]];
        [self.ImageAry removeObjectAtIndex:3];
//        [self.imageAryId removeObjectAtIndex:3];
        [self.imageAryId replaceObjectAtIndex:3 withObject:@(3)];

        [self SetImageViewWithImage:self.ImageAry];
    }
}


#pragma mark 上传技能图片
- (void)httpRequest:(NSInteger)Nmb headPic:(NSString *)headPicStr picName:(NSString *)picNameStr Index:(NSInteger)index
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/user/jiNengTuPian",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId",headPicStr,@"headPic",picNameStr,@"picName",@(Nmb),@"picType",@(index),@"index", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        NSUInteger index = [[[responseObj objectForKey:@"data"]objectForKey:@"index"] integerValue];
        NSUInteger skillPicId = [[[responseObj objectForKey:@"data"]objectForKey:@"skillPicId"] integerValue];
        if (result == 1) {
            [self.imageAryId replaceObjectAtIndex:index withObject:@(skillPicId)];
            

//            [self.imageAryId addObject:@(skillPicId)];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"HeadJumpViewController" object:_imageAryId];
            [self showRightWithTitle:@"修改成功" autoCloseTime:2];
        }else
        {
            
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        
    }];
}


#pragma mark 上传图片
- (void)httpRequest:(NSInteger)Nmb headPic:(NSString *)headPicStr picName:(NSString *)picNameStr
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/user/picUrl",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId",headPicStr,@"headPic",picNameStr,@"picName",@(Nmb),@"picType", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        if (result == 1) {
            [self showRightWithTitle:@"图片上传成功" autoCloseTime:2];
            NSInteger wanShanXinXi= [[[responseObj valueForKey:@"data"] objectForKey:@"wanShanXinXi"] integerValue];
            userManager.curUserInfo = [UserInfo modelWithDictionary:[responseObj objectForKey:@"data"]];
            YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
            NSDictionary *dic = [userManager.curUserInfo modelToJSONObject];
            [cache setObject:dic forKey:KUserModelCache];
        }else
        {
            [self showErrorWithTitle:@"图片上传失败" autoCloseTime:2];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        [self showErrorWithTitle:@"图片上传失败" autoCloseTime:2];
    }];
}
#pragma mark 修改资料
- (void)httpRequest:(NSString *)ZhiStr ChanShu:(NSString *)chanshu
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/user/modify",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId",ZhiStr,chanshu, nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        if (result == 1) {
            [self showRightWithTitle:@"修改成功" autoCloseTime:2];
//            [self httpRequest];
//            wanShanXinXi
            NSInteger wanShanXinXi= [[[responseObj valueForKey:@"data"] objectForKey:@"wanShanXinXi"] integerValue];
            userManager.curUserInfo = [UserInfo modelWithDictionary:[responseObj objectForKey:@"data"]];
            YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
            NSDictionary *dic = [userManager.curUserInfo modelToJSONObject];
            [cache setObject:dic forKey:KUserModelCache];
             
        }else
        {
            [self showErrorWithTitle:@"修改失败" autoCloseTime:2];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        [self showErrorWithTitle:@"修改失败" autoCloseTime:2];
    }];
}

#pragma mark 删除图片
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



-(void)scanBigImageClick:(UITapGestureRecognizer *)tap{
    NSLog(@"点击图片");
    UIImageView *clickedImageView = (UIImageView *)tap.view;
    [XWScanImage scanBigImageWithImageView:clickedImageView];
    
}


- (NSData *)zipNSDataWithImage:(UIImage *)sourceImage{
    //进行图像尺寸的压缩
    CGSize imageSize = sourceImage.size;//取出要压缩的image尺寸
    CGFloat width = imageSize.width;    //图片宽度
    CGFloat height = imageSize.height;  //图片高度
    //1.宽高大于1280(宽高比不按照2来算，按照1来算)
    if (width>1280) {
        if (width>height) {
            CGFloat scale = width/height;
            height = 1280;
            width = height*scale;
        }else{
            CGFloat scale = height/width;
            width = 1280;
            height = width*scale;
        }
        //2.高度大于1280
    }else if(height>1280){
        CGFloat scale = height/width;
        width = 1280;
        height = width*scale;
    }else{
    }
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [sourceImage drawInRect:CGRectMake(0,0,width,height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //进行图像的画面质量压缩
    NSData *data=UIImageJPEGRepresentation(newImage, 1.0);
    if (data.length>100*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data=UIImageJPEGRepresentation(newImage, 0.7);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(newImage, 0.8);
        }else if (data.length>200*1024) {
            //0.25M-0.5M
            data=UIImageJPEGRepresentation(newImage, 0.9);
        }
    }
    return data;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
