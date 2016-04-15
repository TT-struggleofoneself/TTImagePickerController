//
//  UIAlertController+TTExtend.h
//  ServiceCustomer
//
//  Created by TT_code on 16/3/29.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (TTExtend)




#pragma mark - Show Message

/**
 *  @brief  弹出对话框
 *
 *  @param  message 对话框显示的信息
  *  @param  VC 控制器
 *
 *  @return
 */
+ (void)showAlertMessage:(NSString *)message  VC:(UIViewController*)VC;

/**
 *  @brief  弹出对话框
 *
 *  @param  message 对话框显示的信息
 *  @param  title   标题信息
  *  @param  VC 控制器
 *
 *  @return
 */
+ (void)showAlertMessage:(NSString *)message title:(NSString *)title    VC:(UIViewController*)VC  Sure:(void (^)(NSInteger index))sure  Cancel:(void (^)(NSInteger index))cancel;

/**
 *  @brief  隐藏弹出框
 *
 *  @param
 *
 *  @return
 */
+ (void)dismissWithAnimated:(BOOL)animated;




/**
 *  @brief  弹出对话框
 *
 *  @param  message 对话框显示的信息
 *  @param  title 提示标题
 *  @param  VC 控制器
 *  @return
 */
+ (void)showAlertMessage:(NSString *)message title:(NSString *)title    VC:(UIViewController*)VC  Sure:(void (^)(NSInteger index))sure;








//------------------上传图片------------------------
/**
 *  上传图片提示选择
 *
 *  @param VC     控制器
 *  @param camera 拍照block
 *  @param photo  相册block
 *  @param cancel 取消block
 */
+ (void)showActionSheetCameraWithVC:(UIViewController*)VC  Camera:(void (^)(NSInteger index))camera   Photo:(void (^)(NSInteger index))photo   Cancel:(void (^)(NSInteger index))cancel;




/**
 *  sheet 提示样式
 *
 *  @param array  数组 字符串
 *  @param title  提示标题
 *  @param VC     控制器
 *  @param sure   点击按钮
 *  @param cancel 取消按钮
 */
+ (void)showActionSheetWitharray:(NSArray*)array  title:(NSString*)title  VC:(UIViewController*)VC  Sure:(void (^)(NSInteger index))sure  Cancel:(void (^)(NSInteger index))cancel;


@end
