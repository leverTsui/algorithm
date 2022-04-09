//
//  LinkedList.m
//  algo
//
//  Created by 徐利华 on 2022/4/9.
//

#import "LinkedList.h"

@implementation LinkedList

- (ListNode *)nodeWithValue:(int)value {
    ListNode *p = self.head;
    while (p && p.value != value) {
        p = p.next;
    }
    return p;
}

- (ListNode *)nodeAtIndex:(NSUInteger)index {
    ListNode *p = self.head;
    NSUInteger position = 0;
    while (p && position != index) {
        p = p.next;
        position++;
    }
    return p;
}

- (void)insertValueToHead:(int)value {
    ListNode *aNode = [[ListNode alloc] initWithValue:value];
    [self insertNodeToHead:aNode];
}

- (void)insertNodeToHead:(nonnull ListNode *)newNode {
    if (!self.head) {
        self.head = newNode;
    } else {
        newNode.next = self.head;
        self.head = newNode;
    }
}

- (void)insertNodeValueToTail:(int)value {
    ListNode *newNode = [[ListNode alloc] initWithValue:value];
    //空链表，可以插入新节点作为head，也可以不操作
    if (!self.head){
        self.head = newNode;
        return;
    }
    
    // 找到最后一个节点
    ListNode *q = self.head;
    while(q.next){
        q = q.next;
    }
    
    newNode.next = q.next;
    q.next = newNode;
}

- (void)insertNodeWithValue:(int)value
                  afterNode:(nonnull ListNode *)node {
    ListNode *aNode = [[ListNode alloc] initWithValue:value];
    [self insertNode:aNode afterNode:node];
}

- (void)insertNode:(nonnull ListNode *)newNode
        afterNode:(nonnull ListNode *)p {
    if (!p) return;
    newNode.next = p.next;
    p.next = newNode;
}

- (void)insertNodeWithValue:(int)value
                 beforeNode:(nonnull ListNode *)node {
    ListNode* aNode = [[ListNode alloc] initWithValue:value];
    [self insertNode:aNode beforeNode:node];
}

- (void)insertNode:(nonnull ListNode *)newNode
        beforeNode:(nonnull ListNode *)p {
    if (!p) return;
    
    // p节点为头节点
    if (p == self.head) {
        [self insertNodeToHead:newNode];
        return;
    }
    
    // 找到p节点的前一个节点q
    ListNode *q = self.head;
    while (q && q.next != p) {
        q = q.next;
    }
    if (!q) return;
    
    newNode.next = p;
    q.next = newNode;
}

- (void)deleteNode:(nonnull ListNode *)p {
    if (!p || !self.head) return;
    
    // p节点为头节点
    if (p == self.head) {
        self.head = self.head.next;
        return;
    }
    
    // 找到p节点的前一个节点q
    ListNode *q = self.head;
    while (q && q.next != p) {
        q = q.next;
    }
    if (!q) return;
    q.next = q.next.next;
}

- (void)deleteNodesWithValue:(int)value {
//    if (!self.head) return;
//
//    ListNode *p = self.head;
//    ListNode *q = nil;
//    while (!p && p.value != value) {
//        q = p;
//        p = p.next;
//    }
//    if (!p) return;
//
//    // 删除的是头节点
//    if (!q) {
//        self.head = self.head.next;
//    } else {
//        q.next = q.next.next;
//    }
    
    while (self.head && self.head.value == value) {
        self.head = self.head.next;
    }
    
    ListNode *pNode = self.head;
    while (pNode) {
        if (pNode.next.value == value) {
            pNode.next = pNode.next.next;
            continue;
        }
        pNode = pNode.next;
    }
}

- (NSString*)debugDescription {
    NSMutableString* info = [[NSMutableString alloc] init];
    ListNode* current = _head;
    if (current) {
        [info appendString:current.debugDescription];
    }
    current = current.next;
    while (current) {
        [info appendString:@"->"];
        [info appendString:current.debugDescription];
        current = current.next;
    }
    return [NSString stringWithString:info];
}

@end
