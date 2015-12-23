//
//  AlertViewActionDispatcher.h
//  AlertViewExamples
//
//  Created by Mango on 2015. 3. 18..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ActionByCancel -1

typedef void (^UIAlertActionBlock) (UIAlertView *alertView, NSInteger buttonIndex);

@interface AlertViewActionDispatcher : NSObject

- (void)registerAction:(UIAlertActionBlock)action forButtonIndex:(NSInteger)buttonIndex;
- (void)registerCancelAction:(UIAlertActionBlock)action;

@end
