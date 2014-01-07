/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSArray+Nilus.h"

@implementation NSArray (Nilus)

+ (instancetype)arrayWithObjectNil:(id)anObject
{
    if (anObject) {
        return [NSArray arrayWithObject:anObject];
    }
    return [NSArray array];
}

+ (instancetype)arrayWithObjectNull:(id)anObject
{
    if (anObject) {
        return [NSArray arrayWithObject:anObject];
    }
    return [NSArray arrayWithObject:[NSNull null]];
}

+ (instancetype)arrayWithObjectsNil:(const id[])objects size:(size_t)size
{
    NSUInteger count = size / sizeof(id);
    NSMutableArray *mutableResult = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        id obj = objects[i];
        if (obj) {
            [mutableResult addObject:obj];
        }
    }
    NSArray *result = [mutableResult copy];
    return result;
}

+ (instancetype)arrayWithObjectsNull:(const id[])objects size:(size_t)size
{
    NSUInteger count = size / sizeof(id);
    NSMutableArray *mutableResult = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        id obj = objects[i];
        if (obj) {
            [mutableResult addObject:obj];
        } else {
            [mutableResult addObject:[NSNull null]];
        }
    }
    NSArray *result = [mutableResult copy];
    return result;
}

- (NSArray *)arrayByAddingObjectNil:(id)anObject
{
    if (anObject) {
        return [self arrayByAddingObject:anObject];
    }
    return [self copy];
}

- (NSArray *)arrayByAddingObjectNull:(id)anObject
{
    if (anObject) {
        return [self arrayByAddingObject:anObject];
    }
    return [self arrayByAddingObject:[NSNull null]];
}

@end
