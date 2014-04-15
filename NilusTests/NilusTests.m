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
@property (nonatomic, strong, readonly) id anObject, anOtherObject, aKey, anOtherKey;
@end

@implementation NilusTests

- (void)setUp
{
    [super setUp];
    _anObject = @"anObject";
    _anOtherObject = @"anOtherObject";
    _aKey = @"aKey";
    _anOtherKey = @"anOtherKey";
}

- (void)tearDown
{
    [super tearDown];
}

#pragma mark - General

- (void)testAnObjectNotSameAnOtherObject
{
    XCTAssertNotEqual(self.anObject, self.anOtherObject);
}

- (void)testAnObjectNotEqualsAnOtherObject
{
    XCTAssertNotEqualObjects(self.anObject, self.anOtherObject);
}

- (void)testAnKeyNotSameAnOtherKey
{
    XCTAssertNotEqual(self.aKey, self.anOtherKey);
}

- (void)testAnKeyNotEqualsAnOtherKey
{
    XCTAssertNotEqualObjects(self.aKey, self.anOtherKey);
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
    XCTAssertEqual(self.anObject, array[0]);
}

#pragma mark - + (instancetype)arrayWithObjectNull:(id)anObject

- (void)testArrayWithObjectNull_NilReturnsArrayWithNull
{
    NSArray *array = [NSArray arrayWithObjectNull:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual([NSNull null], array[0]);
}

- (void)testArrayWithObjectNull_NonNilReturnsArrayWithObject
{
    NSArray *array = [NSArray arrayWithObjectNull:self.anObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
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
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testArrayWithObjectsNil_NonNilReturnsArrayWithObjects
{
    id c_array[] = { self.anObject, self.anOtherObject };
    NSArray *array = [NSArray arrayWithObjectsNil:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqual(self.anObject, array[0]);
    XCTAssertEqual(self.anOtherObject, array[1]);
}

- (void)testArrayWithObjectsNil_NilAndNonNilReturnsArrayWithObjects
{
    id c_array[] = { nil, self.anObject, nil, self.anOtherObject, nil };
    NSArray *array = [NSArray arrayWithObjectsNil:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqual(self.anObject, array[0]);
    XCTAssertEqual(self.anOtherObject, array[1]);
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
    XCTAssertEqual([NSNull null], array[0]);
}

- (void)testArrayWithObjectsNull_NonNilReturnsArrayWithObject
{
    id c_array[] = { self.anObject };
    NSArray *array = [NSArray arrayWithObjectsNull:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testArrayWithObjectsNull_NonNilReturnsArrayWithObjects
{
    id c_array[] = { self.anObject, self.anOtherObject };
    NSArray *array = [NSArray arrayWithObjectsNull:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqual(self.anObject, array[0]);
    XCTAssertEqual(self.anOtherObject, array[1]);
}

- (void)testArrayWithObjectsNull_NilAndNonNilReturnsArrayWithNullAndObjects
{
    id c_array[] = { nil, self.anObject, nil, self.anOtherObject, nil };
    NSArray *array = [NSArray arrayWithObjectsNull:c_array size:sizeof(c_array)];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)5, array.count);
    XCTAssertEqual([NSNull null], array[0]);
    XCTAssertEqual(self.anObject, array[1]);
    XCTAssertEqual([NSNull null], array[2]);
    XCTAssertEqual(self.anOtherObject, array[3]);
    XCTAssertEqual([NSNull null], array[4]);
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
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testArrayByAddingObjectNil_ArrayWithObjectAddingNilReturnsArrayWithObject
{
    NSArray *array = [@[self.anObject] arrayByAddingObjectNil:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testArrayByAddingObjectNil_ArrayWithObjectAddingNonNilReturnsArrayWithObjects
{
    NSArray *array = [@[self.anObject] arrayByAddingObjectNil:self.anOtherObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqual(self.anObject, array[0]);
    XCTAssertEqual(self.anOtherObject, array[1]);
}

#pragma mark - - (NSArray *)arrayByAddingObjectNull:(id)anObject

- (void)testArrayByAddingObjectNull_EmptyArrayAddingNilReturnsArrayWithNull
{
    NSArray *array = [@[] arrayByAddingObjectNull:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual([NSNull null], array[0]);
}

- (void)testArrayByAddingObjectNull_EmptyArrayAddingNonNilReturnsArrayWithObject
{
    NSArray *array = [@[] arrayByAddingObjectNull:self.anObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testArrayByAddingObjectNull_ArrayWithObjectAddingNilReturnsArrayWithObjectAndNull
{
    NSArray *array = [@[self.anObject] arrayByAddingObjectNull:nil];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqual(self.anObject, array[0]);
    XCTAssertEqual([NSNull null], array[1]);
}

- (void)testArrayByAddingObjectNull_ArrayWithObjectAddingNonNilReturnsArrayWithObjects
{
    NSArray *array = [@[self.anObject] arrayByAddingObjectNull:self.anOtherObject];
    XCTAssertNotNil(array);
    XCTAssertEqual((NSUInteger)2, array.count);
    XCTAssertEqual(self.anObject, array[0]);
    XCTAssertEqual(self.anOtherObject, array[1]);
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
    XCTAssertEqual(self.anObject, array[0]);
}

#pragma mark - - (void)addObjectNull:(id)anObject

- (void)testAddObjectNull_AddNil
{
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectNull:nil];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual([NSNull null], array[0]);
}

- (void)testAddObjectNull_AddObject
{
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectNull:self.anObject];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
}

#pragma mark - - (void)insertObjectNil:(id)anObject atIndex:(NSUInteger)index

- (void)testInsertObjectNil_InsertNil
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNil:nil atIndex:0];
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testInsertObjectNil_InsertNilIndexOutOfBounds
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNil:nil atIndex:1];
    XCTAssertEqual((NSUInteger)0, array.count);
}

- (void)testInsertObjectNil_InsertObject
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNil:self.anObject atIndex:0];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testInsertObjectNil_InsertObjectIndexOutOfBounds
{
    NSMutableArray *array = [NSMutableArray array];
    XCTAssertThrowsSpecificNamed([array insertObjectNil:self.anObject atIndex:1], NSException, NSRangeException);
}

#pragma mark - - (void)insertObjectNull:(id)anObject atIndex:(NSUInteger)index

- (void)testInsertObjectNull_InsertNil
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNull:nil atIndex:0];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual([NSNull null], array[0]);
}

- (void)testInsertObjectNull_InsertNilIndexOutOfBounds
{
    NSMutableArray *array = [NSMutableArray array];
    XCTAssertThrowsSpecificNamed([array insertObjectNull:nil atIndex:1], NSException, NSRangeException);
}

- (void)testInsertObjectNull_InsertObject
{
    NSMutableArray *array = [NSMutableArray array];
    [array insertObjectNull:self.anObject atIndex:0];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testInsertObjectNull_InsertObjectOutOfBounds
{
    NSMutableArray *array = [NSMutableArray array];
    XCTAssertThrowsSpecificNamed([array insertObjectNull:self.anObject atIndex:1], NSException, NSRangeException);
}

#pragma mark - - (void)replaceObjectNilAtIndex:(NSUInteger)index withObject:(id)anObject

- (void)testReplaceObjectAtIndexWithObjectNil_WithNil
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:0 withObjectNil:nil];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testReplaceObjectAtIndexWithObjectNil_WithNilIndexOutOfBounds
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:2 withObjectNil:nil];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anObject, array[0]);
}

- (void)testReplaceObjectAtIndexWithObjectNil
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:0 withObjectNil:self.anOtherObject];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anOtherObject, array[0]);
}

- (void)testReplaceObjectAtIndexWithObjectNil_IndexOutOfBounds
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    XCTAssertThrowsSpecificNamed([array replaceObjectAtIndex:1 withObjectNil:self.anOtherObject], NSException, NSRangeException);
}
#pragma mark - - (void)replaceObjectNullAtIndex:(NSUInteger)index withObject:(id)anObject

- (void)testReplaceObjectAtIndexWithObjectNull_WithNil
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:0 withObjectNull:nil];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual([NSNull null], array[0]);
}

- (void)testReplaceObjectAtIndexWithObjectNull_WithNilIndexOutOfBounds
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    XCTAssertThrowsSpecificNamed([array replaceObjectAtIndex:1 withObjectNull:nil], NSException, NSRangeException);
}

- (void)testReplaceObjectAtIndexWithObjectNull_WithNull
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    [array replaceObjectAtIndex:0 withObjectNull:self.anOtherObject];
    XCTAssertEqual((NSUInteger)1, array.count);
    XCTAssertEqual(self.anOtherObject, array[0]);
}

- (void)testReplaceObjectAtIndexWithObjectNull_WithNullIndexOutOfBounds
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.anObject, nil];
    XCTAssertThrowsSpecificNamed([array replaceObjectAtIndex:1 withObjectNull:self.anOtherObject], NSException, NSRangeException);
}

#pragma mark - NSDictionary
#pragma mark - + (instancetype)dictionaryWithObjectNil:(id)anObject forKey:(id<NSCopying>)aKey

- (void)testDictionaryWithObjectNil_ReturnsDictionaryWithObject
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectNil:self.anObject forKey:self.aKey];
    XCTAssertNotNil(dictionary);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
}

- (void)testDictionaryWithObjectNil_ObjectNilReturnsEmptyDictionary
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectNil:nil forKey:self.aKey];
    XCTAssertNotNil(dictionary);
    XCTAssertEqual((NSUInteger)0, dictionary.count);
}

- (void)testDictionaryWithObjectNil_KeyNil
{
    XCTAssertThrowsSpecificNamed([NSDictionary dictionaryWithObjectNil:self.anObject forKey:nil], NSException, NSInvalidArgumentException);
}

- (void)testDictionaryWithObjectNil_ObjectNilKeyNilReturnsEmptyDictionary
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectNil:nil forKey:nil];
    XCTAssertNotNil(dictionary);
    XCTAssertEqual((NSUInteger)0, dictionary.count);
}

#pragma mark - + (instancetype)dictionaryWithObjectNull:(id)anObject forKey:(id<NSCopying>)aKey;

- (void)testDictionaryWithObjectNull_ReturnsDictionaryWithObject
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectNull:self.anObject forKey:self.aKey];
    XCTAssertNotNil(dictionary);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
}

- (void)testDictionaryWithObjectNull_ObjectNilReturnsDictionaryWithNull
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectNull:nil forKey:self.aKey];
    XCTAssertNotNil(dictionary);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
    XCTAssertEqual([NSNull null], dictionary[self.aKey]);
}

- (void)testDictionaryWithObjectNull_KeyNil
{
    XCTAssertThrowsSpecificNamed([NSDictionary dictionaryWithObjectNull:self.anObject forKey:nil], NSException, NSInvalidArgumentException);
}

- (void)testDictionaryWithObjectNull_ObjectNilKeyNil
{
    XCTAssertThrowsSpecificNamed([NSDictionary dictionaryWithObjectNull:nil forKey:nil], NSException, NSInvalidArgumentException);
}

#pragma mark - + (instancetype)dictionaryWithObjectsNil:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count;

- (void)testDictionaryWithObjectsNil_EmptyReturnEmptyDictionary
{
    id objects[] = { };
    id keys[] = { };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNil:objects forKeys:keys count:0];
    XCTAssertEqual((NSUInteger)0, dictionary.count);
}

- (void)testDictionaryWithObjectsNil_NilObject
{
    id objects[] = { nil };
    id keys[] = { self.aKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNil:objects forKeys:keys count:1];
    XCTAssertEqual((NSUInteger)0, dictionary.count);
}

- (void)testDictionaryWithObjectsNil_NonNilObject
{
    id objects[] = { self.anObject };
    id keys[] = { self.aKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNil:objects forKeys:keys count:1];
    XCTAssertEqual((NSUInteger)1, dictionary.count);
}

- (void)testDictionaryWithObjectsNil_NonNilObjectsFullCount
{
    id objects[] = { self.anObject, self.anOtherObject };
    id keys[] = { self.aKey, self.anOtherKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNil:objects forKeys:keys count:2];
    XCTAssertEqual((NSUInteger)2, dictionary.count);
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
    XCTAssertEqual(self.anOtherObject, dictionary[self.anOtherKey]);
}

- (void)testDictionaryWithObjectsNil_NonNilObjectsReducedCount
{
    id objects[] = { self.anObject, self.anOtherObject };
    id keys[] = { self.aKey, self.anOtherKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNil:objects forKeys:keys count:1];
    XCTAssertEqual((NSUInteger)1, dictionary.count);
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
    XCTAssertNil(dictionary[self.anOtherKey]);
}

- (void)testDictionaryWithObjectsNil_NilObjectsFullCount
{
    id objects[] = { nil, self.anOtherObject };
    id keys[] = { self.aKey, self.anOtherKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNil:objects forKeys:keys count:2];
    XCTAssertEqual((NSUInteger)1, dictionary.count);
    XCTAssertEqual(self.anOtherObject, dictionary[self.anOtherKey]);
    XCTAssertNil(dictionary[self.aKey]);
}


#pragma mark - + (instancetype)dictionaryWithObjectsNull:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count

- (void)testDictionaryWithObjectsNull_EmptyReturnEmptyDictionary
{
    id objects[] = { };
    id keys[] = { };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNull:objects forKeys:keys count:0];
    XCTAssertEqual((NSUInteger)0, dictionary.count);
}

- (void)testDictionaryWithObjectsNull_NilObject
{
    id objects[] = { nil };
    id keys[] = { self.aKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNull:objects forKeys:keys count:1];
    XCTAssertEqual((NSUInteger)1, dictionary.count);
    XCTAssertEqual([NSNull null], dictionary[self.aKey]);
}

- (void)testDictionaryWithObjectsNull_NonNilObject
{
    id objects[] = { self.anObject };
    id keys[] = { self.aKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNull:objects forKeys:keys count:1];
    XCTAssertEqual((NSUInteger)1, dictionary.count);
}

- (void)testDictionaryWithObjectsNull_NonNilObjectsFullCount
{
    id objects[] = { self.anObject, self.anOtherObject };
    id keys[] = { self.aKey, self.anOtherKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNull:objects forKeys:keys count:2];
    XCTAssertEqual((NSUInteger)2, dictionary.count);
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
    XCTAssertEqual(self.anOtherObject, dictionary[self.anOtherKey]);
}

- (void)testDictionaryWithObjectsNull_NonNilObjectsReducedCount
{
    id objects[] = { self.anObject, self.anOtherObject };
    id keys[] = { self.aKey, self.anOtherKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNull:objects forKeys:keys count:1];
    XCTAssertEqual((NSUInteger)1, dictionary.count);
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
    XCTAssertNil(dictionary[self.anOtherKey]);
}

- (void)testDictionaryWithObjectsNull_NilObjectsFullCount
{
    id objects[] = { nil, self.anOtherObject };
    id keys[] = { self.aKey, self.anOtherKey };
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsNull:objects forKeys:keys count:2];
    XCTAssertEqual((NSUInteger)2, dictionary.count);
    XCTAssertEqual([NSNull null], dictionary[self.aKey]);
    XCTAssertEqual(self.anOtherObject, dictionary[self.anOtherKey]);
}

#pragma mark - NSMutableDictionary

#pragma mark - - (void)setObjectNil:(id)anObject forKey:(id<NSCopying>)aKey

- (void)testSetObjectNil_NilObject
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObjectNil:nil forKey:self.aKey];
    XCTAssertNil(dictionary[self.aKey]);
    XCTAssertEqual((NSUInteger)0, dictionary.count);
}

- (void)testSetObjectNil_NonNilObject
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObjectNil:self.anObject forKey:self.aKey];
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
}

- (void)testSetObjectNil_NilObjectNoKeyOverwrite
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:self.anObject forKey:self.aKey];
    [dictionary setObjectNil:nil forKey:self.aKey];
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
}

- (void)testSetObjectNil_NilObjectWithKeyOverwrite
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:self.anObject forKey:self.aKey];
    [dictionary setObjectNil:self.anOtherObject forKey:self.aKey];
    XCTAssertEqual(self.anOtherObject, dictionary[self.aKey]);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
}

#pragma mark - - (void)setObjectNull:(id)anObject forKey:(id<NSCopying>)aKey

- (void)testSetObjectNull_NilObject
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObjectNull:nil forKey:self.aKey];
    XCTAssertEqual([NSNull null], dictionary[self.aKey]);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
}

- (void)testSetObjectNull_NonNilObject
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObjectNull:self.anObject forKey:self.aKey];
    XCTAssertEqual(self.anObject, dictionary[self.aKey]);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
}

- (void)testSetObjectNull_NilObjectWithKeyOverwrite
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:self.anObject forKey:self.aKey];
    [dictionary setObjectNull:nil forKey:self.aKey];
    XCTAssertEqual([NSNull null], dictionary[self.aKey]);
    XCTAssertEqual((NSUInteger)1, dictionary.count);
}

@end
