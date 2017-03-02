//
//  WXSBlockAlertView.h
//  WXSBlockAlertView
//
//  Created by AlanWang on 17/3/2.
//  Copyright © 2017年 AlanWang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertBlock)(NSInteger);

@interface WXSBlockAlertView : UIAlertView

@property(nonatomic,copy)AlertBlock block;

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
        clickButton:(AlertBlock)block
  otherButtonTitles:(NSString *)otherButtonTitles, ...;


@end
