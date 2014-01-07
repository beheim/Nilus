/*

The MIT License (MIT)

Copyright (c) 2014 Masashi Beheim

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 */

#import <XCTest/XCTest.h>
#import "Nilus.h"

@interface NilusTests : XCTestCase
@property (nonatomic, strong) id anObject, anOtherObject;
@end

@implementation NilusTests

- (void)setUp
{
    [super setUp];
    self.anObject = @"";
    self.anOtherObject = @"";
}

- (void)tearDown
{
    self.anObject = nil;
    self.anOtherObject = nil;
    [super tearDown];
}

#pragma mark - NSArray
#pragma mark - + (instancetype)arrayWithObjectNil:(id)anObject

- (void)testArrayWithObjectNil_NilReturnsEmptyArray
{
    NSArray *array = [NSArray arrayWithObjectNil:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testArrayWithObjectNil_NonNilReturnsArrayWithObject
{
    NSArray *array = [NSArray arrayWithObjectNil:self.anObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

#pragma mark - + (instancetype)arrayWithObjectNull:(id)anObject

- (void)testArrayWithObjectNull_NilReturnsArrayWithNull
{
    NSArray *array = [NSArray arrayWithObjectNull:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects([NSNull null], array[0]);
}

- (void)testArrayWithObjectNull_NonNilReturnsArrayWithObject
{
    NSArray *array = [NSArray arrayWithObjectNull:self.anObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

#pragma mark - + (instancetype)arrayWithObjectsNil:(__strong id [])objects size:(size_t)size

- (void)testArrayWithObjectsNil_EmptyReturnsEmptyArray
{
    id c_array[] = { };
    NSArray *array = [NSArray arrayWithObjectsNil:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testArrayWithObjectsNil_NilReturnsEmptyArray
{
    id c_array[] = { nil };
    NSArray *array = [NSArray arrayWithObjectsNil:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testArrayWithObjectsNil_NonNilReturnsArrayWithObject
{
    id c_array[] = { self.anObject };
    NSArray *array = [NSArray arrayWithObjectsNil:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

- (void)testArrayWithObjectsNil_NonNilReturnsArrayWithObjects
{
    id c_array[] = { self.anObject, self.anOtherObject };
    NSArray *array = [NSArray arrayWithObjectsNil:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
    XCTAssertEqualObjects(self.anOtherObject, array[1]);
}

- (void)testArrayWithObjectsNil_NilAndNonNilReturnsArrayWithObjects
{
    id c_array[] = { nil, self.anObject, nil, self.anOtherObject, nil };
    NSArray *array = [NSArray arrayWithObjectsNil:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
    XCTAssertEqualObjects(self.anOtherObject, array[1]);
}

#pragma mark - + (instancetype)arrayWithObjectsNil:(__strong id [])objects size:(size_t)size

- (void)testArrayWithObjectsNull_EmptyReturnsArrayWithNull
{
    id c_array[] = { };
    NSArray *array = [NSArray arrayWithObjectsNull:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testArrayWithObjectsNull_NilReturnsArrayWithNull
{
    id c_array[] = { nil };
    NSArray *array = [NSArray arrayWithObjectsNull:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects([NSNull null], array[0]);
}

- (void)testArrayWithObjectsNull_NonNilReturnsArrayWithObject
{
    id c_array[] = { self.anObject };
    NSArray *array = [NSArray arrayWithObjectsNull:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

- (void)testArrayWithObjectsNull_NonNilReturnsArrayWithObjects
{
    id c_array[] = { self.anObject, self.anOtherObject };
    NSArray *array = [NSArray arrayWithObjectsNull:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
    XCTAssertEqualObjects(self.anOtherObject, array[1]);
}

- (void)testArrayWithObjectsNull_NilAndNonNilReturnsArrayWithNullAndObjects
{
    id c_array[] = { nil, self.anObject, nil, self.anOtherObject, nil };
    NSArray *array = [NSArray arrayWithObjectsNull:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)5, array.count);
    XCTAssertEqualObjects([NSNull null], array[0]);
    XCTAssertEqualObjects(self.anObject, array[1]);
    XCTAssertEqualObjects([NSNull null], array[2]);
    XCTAssertEqualObjects(self.anOtherObject, array[3]);
    XCTAssertEqualObjects([NSNull null], array[4]);
}

#pragma mark - - (NSArray *)arrayByAddingObjectNil:(id)anObject

- (void)testArrayByAddingObjectNil_EmptyArrayAddingNilReturnsEmptArray
{
    NSArray *array = [@[] arrayByAddingObjectNil:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testArrayByAddingObjectNil_EmptyArrayAddingNonNilReturnsArrayWithObject
{
    NSArray *array = [@[] arrayByAddingObjectNil:self.anObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

- (void)testArrayByAddingObjectNil_ArrayWithObjectAddingNilReturnsArrayWithObject
{
    NSArray *array = [@[self.anObject] arrayByAddingObjectNil:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

- (void)testArrayByAddingObjectNil_ArrayWithObjectAddingNonNilReturnsArrayWithObjects
{
    NSArray *array = [@[self.anObject] arrayByAddingObjectNil:self.anOtherObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
    XCTAssertEqualObjects(self.anOtherObject, array[1]);
}

#pragma mark - - (NSArray *)arrayByAddingObjectNull:(id)anObject

- (void)testArrayByAddingObjectNull_EmptyArrayAddingNilReturnsArrayWithNull
{
    NSArray *array = [@[] arrayByAddingObjectNull:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects([NSNull null], array[0]);
}

- (void)testArrayByAddingObjectNull_EmptyArrayAddingNonNilReturnsArrayWithObject
{
    NSArray *array = [@[] arrayByAddingObjectNull:self.anObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

- (void)testArrayByAddingObjectNull_ArrayWithObjectAddingNilReturnsArrayWithObjectAndNull
{
    NSArray *array = [@[self.anObject] arrayByAddingObjectNull:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
    XCTAssertEqualObjects([NSNull null], array[1]);
}

- (void)testArrayByAddingObjectNull_ArrayWithObjectAddingNonNilReturnsArrayWithObjects
{
    NSArray *array = [@[self.anObject] arrayByAddingObjectNull:self.anOtherObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
    XCTAssertEqualObjects(self.anOtherObject, array[1]);
}

#pragma mark - NSMutableArray

#pragma mark - - (void)addObjectNil:(id)anObject

- (void)testAddObjectNil_AddNil
{
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectNil:nil];
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testAddObjectNil_AddObject
{
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectNil:self.anObject];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

#pragma mark - - (void)addObjectNull:(id)anObject

- (void)testAddObjectNull_AddNil
{
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectNull:nil];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects([NSNull null], array[0]);
}

- (void)testAddObjectNull_AddObject
{
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectNull:self.anObject];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

#pragma mark - - (void)insertObjectNil:(id)anObject atIndex:(NSUInteger)index

- (void)testInsertObjectNil_InsertNil
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNil:nil atIndex:0];
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testInsertObjectNil_InsertObject
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNil:self.anObject atIndex:0];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

#pragma mark - - (void)insertObjectNull:(id)anObject atIndex:(NSUInteger)index

- (void)testInsertObjectNull_InsertNil
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNull:nil atIndex:0];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects([NSNull null], array[0]);
}

- (void)testInsertObjectNull_InsertObject
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNull:self.anObject atIndex:0];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

#pragma mark - - (void)replaceObjectNilAtIndex:(NSUInteger)index withObject:(id)anObject

- (void)testReplaceObjectAtIndexWithObjectNil_WithNil
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:0 withObjectNil:nil];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anObject, array[0]);
}

- (void)testReplaceObjectAtIndexWithObjectNil_WithNull
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:0 withObjectNull:self.anOtherObject];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anOtherObject, array[0]);
}

#pragma mark - - (void)replaceObjectNullAtIndex:(NSUInteger)index withObject:(id)anObject

- (void)testReplaceObjectAtIndexWithObjectNull_WithNil
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:0 withObjectNull:nil];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects([NSNull null], array[0]);
}

- (void)testReplaceObjectAtIndexWithObjectNull_WithNull
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:0 withObjectNull:self.anOtherObject];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqualObjects(self.anOtherObject, array[0]);
}

@end
