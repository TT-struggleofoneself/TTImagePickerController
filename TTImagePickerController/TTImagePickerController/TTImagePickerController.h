
#import <UIKit/UIKit.h>

/**
 *   选择图片代理
 */
@class TTImagePickerController;
@protocol TTImagePickerControllerDelegate <NSObject>

@required
-(void)TTImagePickerController:(TTImagePickerController*)Controller selectedimage:(UIImage*)image;//选择图片代理
@end


///选择一张图片封装
@interface TTImagePickerController : UIViewController


/**
 *   代理
 */
@property(nonatomic,weak)id<TTImagePickerControllerDelegate> delegates;//

/**
 *   增加提示
 */
-(void)addactioonshet;





/**
 *   单例
 */
+(TTImagePickerController*)sharedTTImagePickerController;

/**
 *   显示-默认会显示提示文字
 */
-(void)Show;

@end



