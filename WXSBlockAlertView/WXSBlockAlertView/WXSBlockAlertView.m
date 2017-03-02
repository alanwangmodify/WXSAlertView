//
//  WXSBlockAlertView.m
//  WXSBlockAlertView
//
//  Created by AlanWang on 17/3/2.
//  Copyright © 2017年 AlanWang. All rights reserved.
//

#import "WXSBlockAlertView.h"

@implementation WXSBlockAlertView

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
        clickButton:(AlertBlock)block
  otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self) {
        self.block = block;
        
        if (otherButtonTitles.length > 0) {
            va_list args;
            va_start(args, otherButtonTitles);
            if (otherButtonTitles)
            {
                NSString *otherString;
                while ((otherString = va_arg(args, NSString *)))
                {
                    [self addButtonWithTitle:otherString];
                }
            }
            va_end(args);
        }
        
    }
    
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.block(buttonIndex);
}

- (void)showWithDuration:(NSTimeInterval)duration {
    [self show];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(dismissView) object:nil];
    [self performSelector:@selector(dismissView) withObject:nil afterDelay:duration];
}

- (void)dismissView {
    NSInteger buttonIndex = -1;
    [self dismissWithClickedButtonIndex:buttonIndex animated:YES];
    self.block(buttonIndex);
}
@end
