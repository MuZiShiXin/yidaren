//  昵称
//  NicknameChangeViewController.m
//  YiShopkeeper
//
//  Created by  apple on 2017/11/27.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "NicknameChangeViewController.h"

@interface NicknameChangeViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *NicknameChangeTextField;

@end

@implementation NicknameChangeViewController

- (BOOL)isHideBackButton
{
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = _BiaoTiTitleLabelText;
    
    if ([_BiaoTiTitleLabelText isEqualToString:@"昵称"]) {
        _NicknameChangeTextField.placeholder = @"10个字之内";
    }else if ([_BiaoTiTitleLabelText isEqualToString:@"身份证号"])
    {
        _NicknameChangeTextField.placeholder = @"请输入身份证号";

    }else if ([_BiaoTiTitleLabelText isEqualToString:@"社会信用代码"])
    {
        _NicknameChangeTextField.placeholder = @"请输入信用代码";
    }
    
    _NicknameChangeTextField.delegate = self;
    _NicknameChangeTextField.clearButtonMode = UITextFieldViewModeAlways;
    [_NicknameChangeTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
    
}
#pragma mark 确定按钮
- (IBAction)determineButton {
    NSLog(@"确定");
    if ([_BiaoTiTitleLabelText isEqualToString:@"昵称"]) {
        NSLog(@"昵称确认");
        if (_block != nil) {
            _block(_NicknameChangeTextField.text);
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else if ([_BiaoTiTitleLabelText isEqualToString:@"身份证号"]){
        NSLog(@"身份证号");
        if ([self checkUserID:_NicknameChangeTextField.text]){
            if (_block != nil) {
                _block(_NicknameChangeTextField.text);
                [self.navigationController popViewControllerAnimated:YES];

            }
        }else
        {
            [self.view showErrorWithTitle:@"请输入正确身份证号" autoCloseTime:2];
        }
    }else{
        NSLog(@"信用代码确认");
        if (_block != nil) {
            _block(_NicknameChangeTextField.text);
            [self.navigationController popViewControllerAnimated:YES];

        }
    }
}

#pragma mark 点击resign收起键盘
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
#pragma mark 点击空白收起键盘
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer
{
    [self.view endEditing:YES];
}

#pragma mark 限制输入字数
- (void)textFieldDidChange:(UITextField *)textField
{
    if ([_BiaoTiTitleLabelText isEqualToString:@"昵称"]) {
        UITextRange *rang = textField.markedTextRange; // 获取非=选中状态文字范围
        if (rang == nil) {
            if (textField == _NicknameChangeTextField) {
                if (textField.text.length > 10) {
                    textField.text = [textField.text substringToIndex:10];
                }
            }
        }
    }else
    {
        if (textField == _NicknameChangeTextField) {
            if (textField.text.length > 18) {
                textField.text = [textField.text substringToIndex:18];
            }
        }
    }
    
}


- (BOOL)checkUserID:(NSString *)userID
{
    //长度不为18的都排除掉
    if (userID.length!=18) {
        [self.view showErrorWithTitle:@"身份证号不得少于18位" autoCloseTime:2];
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [userID substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return YES;
            }else
            {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
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
