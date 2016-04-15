//
//  TTImagePickerController.m
//  JinChengITService
//
//  Created by TT_code on 15/12/21.
//  Copyright © 2015年 TT_code. All rights reserved.
//

#import "TTImagePickerController.h"
#import "UIAlertController+TTExtend.h"
@interface TTImagePickerController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
//{
//    UIImagePickerController  *_ipc;//图片管理控制器
//}
@property(nonatomic,strong)NSArray* array;
@property(nonatomic,strong)UIImagePickerController* ipc;

@end

@implementation TTImagePickerController



/**
 *   单例
 */
+(TTImagePickerController*)sharedTTImagePickerController
{
    static dispatch_once_t once;
    static TTImagePickerController *sharedpicker;
    dispatch_once(&once, ^ {
        sharedpicker = [[TTImagePickerController alloc]init];
    });
    return sharedpicker;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor=[UIColor clearColor];
    self.view.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    
}

#pragma mark-增加提示
/**
 *   增加提示
 */
-(void)addactioonshet
{
    self.view.hidden=NO;
    if(!_ipc){
        _ipc=[[UIImagePickerController alloc]init];
        _ipc.delegate=self;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        _ipc.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [UIAlertController showActionSheetCameraWithVC:self Camera:^(NSInteger index) {
        //判断当前相机是否可用
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){// 打开相机
            self.ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
            //设置是否可编辑
            self.ipc.allowsEditing = YES;
            //打开
            [self presentViewController:self.ipc animated:YES completion:nil];
        }else{
            [UIAlertController showAlertMessage:@"设备不可用..." VC:self];
        }
    } Photo:^(NSInteger index) {
        //打开相册
        self.ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //设置是否可编辑
        self.ipc.allowsEditing = YES;
        [self presentViewController:self.ipc animated:YES completion:nil];
    } Cancel:^(NSInteger index) {
        [self  Hidden];
    }];
}


//#pragma mark-修改选择图片的取消按钮颜色
///**
// *  修改选择图片的取消按钮颜色
// */
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    [viewController.navigationController.navigationBar setBackgroundImage:[[UIImage imageNamed:@"backnaviimage"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch] forBarMetrics:UIBarMetricsDefault];
//}

#pragma mark-照片delegate
/**
 *  设备协议
 */
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    //处理图片-压缩
    NSData *imgData=UIImageJPEGRepresentation(image, 0.5);
    NSLog(@"获取到图片的大小是:%u",[imgData length]/1024);
    //上传图片
    if([self.delegates respondsToSelector:@selector(TTImagePickerController:selectedimage:)]){
        self.view.hidden=YES;
        self.view.userInteractionEnabled=NO;
        self.view.backgroundColor=[UIColor clearColor];
        [self.delegates TTImagePickerController:self selectedimage:image];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        [self Hidden];
    }];
}


/**
 *  取消选择图片
 */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self Hidden];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  显示
 */
-(void)Show{
    [self addactioonshet];
}



-(void)Hidden{
    self.view.hidden=YES;
}




@end
