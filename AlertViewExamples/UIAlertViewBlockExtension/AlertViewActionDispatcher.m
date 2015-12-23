//
//  AlertViewActionDispatcher.m
//  AlertViewExamples
//
//  Created by Mango on 2015. 3. 18..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "AlertViewActionDispatcher.h"

@interface AlertViewActionDispatcher ()

@property (nonatomic, strong) NSMutableDictionary *actionBlockDictionary;

@end

@implementation AlertViewActionDispatcher

- (id)init {
    self = [super init];
    if (self) {
        self.actionBlockDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)registerAction:(UIAlertActionBlock)action forButtonIndex:(NSInteger)buttonIndex {
    if (action) {
        [self.actionBlockDictionary setObject:action forKey:@(buttonIndex)];
    }
}

- (void)registerCancelAction:(UIAlertActionBlock)action {
    if (action) {
        [self.actionBlockDictionary setObject:action forKey:@(ActionByCancel)];
    }
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self excuteActionForAlertView:alertView buttonIndex:buttonIndex];
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    if ([self excuteActionForAlertView:alertView buttonIndex:ActionByCancel] == NO) {
        [self excuteActionForAlertView:alertView buttonIndex:alertView.cancelButtonIndex];
    }
}

#pragma mark - private
- (BOOL)excuteActionForAlertView:(UIAlertView *)alertView buttonIndex:(NSInteger)buttonIndex {
    UIAlertActionBlock action = [self.actionBlockDictionary objectForKey:@(buttonIndex)];
    if (action) {
        action(alertView, buttonIndex);
        return YES;
    }
    return NO;
}

@end
