//
//  ListNode.h
//  algo
//
//  Created by Wenru Dong on 2018/10/6.
//  Copyright © 2018年 Wenru Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

@property (nonatomic, assign) int value;

@property (nonatomic, strong, nullable) ListNode *next;

- (instancetype)initWithValue:(int)value;

@end

NS_ASSUME_NONNULL_END
