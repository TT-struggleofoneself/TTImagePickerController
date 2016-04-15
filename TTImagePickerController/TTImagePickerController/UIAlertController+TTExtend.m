//
//  UIAlertController+TTExtend.m
//  ServiceCustomer
//
//  Created by TT_code on 16/3/29.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import "UIAlertController+TTExtend.h"

@implementation UIAlertController (TTExtend)


static UIAlertController *_alertView;

#pragma mark - Show Message

+ (void)showAlertMessage:(NSString *)message  VC:(UIViewController*)VC {
    [self showAlertMessage:message title:@"提示" VC:VC Sure:nil];
}

+ (void)showAlertMessage:(NSString *)message title:(NSString *)title    VC:(UIViewController*)VC  Sure:(void (^)(NSInteger index))sure  Cancel:(void (^)(NSInteger index))cancel
{
    [self dismissWithAnimated:NO];
    _alertView =[UIAlertController  alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [_alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancel(0);
    }]];
     [_alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
         //点击了确定按钮
         sure(1);
     }]];
    [VC presentViewController:_alertView animated:YES completion:nil];
}

+ (void)dismissWithAnimated:(BOOL)animated
{
    if (_alertView) {
        [_alertView dismissViewControllerAnimated:animated completion:nil];
    }
}

+ (void)showAlertMessage:(NSString *)message title:(NSString *)title    VC:(UIViewController*)VC  Sure:(void (^)(NSInteger index))sure
{
    [self showAlertMessage:message title:title VC:VC Sure:^(NSInteger index) {
        sure(1);//确定按钮
    } Cancel:^(NSInteger index) {
        
    }];
}










/**
 *  上传图片提示选择
 *
 *  @param VC     控制器
 *  @param camera 拍照block
 *  @param photo  相册block
 *  @param cancel 取消block
 */
+ (void)showActionSheetCameraWithVC:(UIViewController*)VC  Camera:(void (^)(NSInteger index))camera   Photo:(void (^)(NSInteger index))photo   Cancel:(void (^)(NSInteger index))cancel
{
    [self dismissWithAnimated:NO];
    _alertView =[UIAlertController  alertControllerWithTitle:@"上传图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    [_alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancel(0);
    }]];
    [_alertView addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //点击了拍照按钮
        camera(1);
    }]];
    [_alertView addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击了相册按钮
        photo(1);
    }]];
    [VC presentViewController:_alertView animated:YES completion:nil];
}


/**
 *  sheet 提示样式
 *
 *  @param array  数组 字符串
 *  @param title  提示标题
 *  @param VC     控制器
 *  @param sure   点击按钮
 *  @param cancel 取消按钮
 */
+ (void)showActionSheetWitharray:(NSArray*)array  title:(NSString*)title  VC:(UIViewController*)VC  Sure:(void (^)(NSInteger index))sure  Cancel:(void (^)(NSInteger index))cancel
{
    [self dismissWithAnimated:NO];
    
    _alertView =[UIAlertController  alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    [_alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancel(0);
    }]];
    
    
    for (int i=0; i<array.count; i++) {
        [_alertView addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //点击了确定按钮
            sure(i);
        }]];
    }
    
    [VC presentViewController:_alertView animated:YES completion:nil];
}





@end
