//
//  ViewController.m
//  TTImagePickerController
//
//  Created by TT_code on 16/4/11.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import "ViewController.h"
#import "TTImagePickerController.h"
#import "UIAlertController+TTExtend.h"
@interface ViewController ()<TTImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)Click:(UIButton *)sender {
    TTImagePickerController* VC=[[TTImagePickerController alloc]init];
    VC.delegates=self;
    [self.view addSubview:VC.view];
    [VC  addactioonshet];//提示框
    
}


/**
 *  选择图片完成
 *
 *  @param Controller
 *  @param image
 */
-(void)TTImagePickerController:(TTImagePickerController*)Controller selectedimage:(UIImage*)image
{
    
}


@end
