/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSArray+Nilus.h"

@implementation NSArray (Nilus)

#pragma mark - + (instancetype)arrayWithObject:(id)anObject

+ (instancetype)arrayWithObjectNil:(id)anObject
{
    return [self arrayWithObject:anObject isNull:NO];
}

+ (instancetype)arrayWithObjectNull:(id)anObject
{
    return [self arrayWithObject:anObject isNull:YES];
}

+ (instancetype)arrayWithObject:(id)anObject isNull:(BOOL)isNull
{
    if (anObject) {
        return [NSArray arrayWithObject:anObject];
    } else if (isNull) {
        return [NSArray arrayWithObject:[NSNull null]];
    }
    return [NSArray array];
}

#pragma mark - + (instancetype)arrayWithObjects:(const id [])objects count:(NSUInteger)count

+ (instancetype)arrayWithObjectsNil:(const id[])objects size:(size_t)size
{
    return [self arrayWithObjects:objects size:size isNull:NO];
}

+ (instancetype)arrayWithObjectsNull:(const id[])objects size:(size_t)size
{
    return [self arrayWithObjects:objects size:size isNull:YES];
}

+ (instancetype)arrayWithObjects:(const id[])objects size:(size_t)size isNull:(BOOL)isNull
{
    NSUInteger count = size / sizeof(id);
    NSMutableArray *mutableResult = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        id object = objects[i];
        if (object) {
            [mutableResult addObject:object];
        } else if (isNull) {
            [mutableResult addObject:[NSNull null]];
        }
    }
    return [mutableResult copy];
}

#pragma mark - - (NSArray *)arrayByAddingObject:(id)anObject

- (NSArray *)arrayByAddingObjectNil:(id)anObject
{
    return [self arrayByAddingObject:anObject isNull:NO];
}

- (NSArray *)arrayByAddingObjectNull:(id)anObject
{
    return [self arrayByAddingObject:anObject isNull:YES];
}

- (NSArray *)arrayByAddingObject:(id)anObject isNull:(BOOL)isNull
{
    if (anObject) {
        return [self arrayByAddingObject:anObject];
    } else if (isNull) {
        return [self arrayByAddingObject:[NSNull null]];
    }
    return [self copy];
}

@end
