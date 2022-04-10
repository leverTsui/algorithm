//
//  LinkedList.h
//  algo
//
//  Created by 徐利华 on 2022/4/9.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface LinkedList : NSObject

@property (nonatomic, strong) ListNode *head;

- (ListNode *)nodeWithValue:(int)value;

- (ListNode *)nodeAtIndex:(NSUInteger)index;

- (void)insertValueToHead:(int)value;

- (void)insertNodeToHead:(nonnull ListNode *)node;

- (void)insertNodeWithValue:(int)value
                  afterNode:(nonnull ListNode *)node;

- (void)insertNode:(nonnull ListNode *)newNode
         afterNode:(nonnull ListNode *)p;

- (void)insertNodeWithValue:(int)value
                 beforeNode:(nonnull ListNode *)node;

- (void)insertNode:(nonnull ListNode *)aNode
        beforeNode:(nonnull ListNode *)node;

- (void)deleteNode:(nonnull ListNode *)node;

- (void)deleteNodesWithValue:(int)value;

@end

NS_ASSUME_NONNULL_END
