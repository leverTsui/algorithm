//
//  SinglyLinkedListTests.m
//  SinglyLinkedListTests
//
//  Created by Wenru Dong on 2018/10/6.
//  Copyright © 2018年 Wenru Dong. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListNode.h"
#import "LinkedList.h"

@interface SinglyLinkedListTests : XCTestCase

@end

@implementation SinglyLinkedListTests
{
    LinkedList* _list;
    NSArray* _nodes;
}
- (void)setUp {
    [super setUp];
    ListNode* node1 = [[ListNode alloc] initWithValue:1];
    ListNode* node2 = [[ListNode alloc] initWithValue:2];
    ListNode* node3 = [[ListNode alloc] initWithValue:3];
    ListNode* node4 = [[ListNode alloc] initWithValue:4];
    ListNode* node5 = [[ListNode alloc] initWithValue:5];
    ListNode* node6 = [[ListNode alloc] initWithValue:6];
    node1.next = node2;
    node2.next = node3;
    node3.next = node4;
    node4.next = node5;
    node5.next = node6;
    
    _list = [[LinkedList alloc] init];
    _list.head = node1;
    _nodes = [NSArray arrayWithObjects:node1, node2, node3, node4, node5, node6, nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNodeWithValue {
    XCTAssertEqualObjects([_list nodeWithValue:1], _list.head);
    XCTAssertNil([_list nodeWithValue:10]);
}

- (void)testNodeAtIndex {
    XCTAssertEqualObjects([_list nodeAtIndex:4], _nodes[4]);
    XCTAssertNil([_list nodeAtIndex:10]);
}

- (void)testInsertNodeWithValue {
    [_list insertValueToHead:9];
    XCTAssertEqual(_list.head.value, 9);
    XCTAssertEqual(_list.head.next.value, 1);
}

- (void)testInsertNode {
    ListNode* aNode = [[ListNode alloc] initWithValue:7];
    [_list insertNodeToHead:aNode];
    XCTAssertEqualObjects(_list.head, aNode);
}

- (void)testInsertNodeWithValueAfterNode {
    [_list insertNodeWithValue:12 afterNode:_nodes[3]];
    XCTAssertEqual([[_list nodeAtIndex:4] value], 12);
}

- (void)testInsertNodeAfterNode {
    ListNode* aNode = [[ListNode alloc] initWithValue:28];
    [_list insertNode:aNode afterNode:_nodes[5]];
    ListNode* prevNode = (ListNode *)_nodes[5];
    XCTAssertEqualObjects(aNode, prevNode.next);
}

- (void)testInsertNodeBeforeNode {
    ListNode* aNode = [[ListNode alloc] initWithValue:27];
    ListNode* prevNode = (ListNode *)_nodes[3];
    [_list insertNode:aNode beforeNode:_nodes[4]];
    XCTAssertEqualObjects(aNode, prevNode.next);
}

- (void)testInsertNodeBeforeUnconnectedNode {
    ListNode* aNode = [[ListNode alloc] initWithValue:27];
    ListNode* floatingNode = [[ListNode alloc] initWithValue:36];
    [_list insertNode:aNode beforeNode:floatingNode];
    for (NSUInteger i = 0; i < 6; i++) {
        XCTAssertEqualObjects([_list nodeAtIndex:i], _nodes[i]);
    }
}

- (void)testDeleteNode {
    [_list deleteNode:_nodes[0]];
    XCTAssertEqual(_list.head.value, 2);
    [_list deleteNode:_nodes[5]];
    ListNode* lastNode = (ListNode *)_nodes[4];
    XCTAssertNil(lastNode.next);
}

- (void)testDeleteNodesWithValue {
    ListNode* firstNode = [[ListNode alloc] initWithValue:1];
    ListNode* secondNode = [[ListNode alloc] initWithValue:1];
    [_list insertNodeToHead:firstNode];
    [_list insertNodeToHead:secondNode];
    [_list deleteNodesWithValue:1];
    for (NSUInteger i = 1; i < 6; i++) {
        XCTAssertEqualObjects([_list nodeAtIndex:i-1], _nodes[i]);
    }
}

- (void)testDebugDescription {
    XCTAssertEqualObjects(_list.debugDescription, @"1->2->3->4->5->6");
}

@end
