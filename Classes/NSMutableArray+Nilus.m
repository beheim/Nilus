/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSMutableArray+Nilus.h"

@implementation NSMutableArray (Nilus)

#pragma mark - - (void)addObject:(id)anObject

- (void)addObjectNil:(id)anObject
{
    [self addObject:anObject isNull:NO];
}

- (void)addObjectNull:(id)anObject
{
    [self addObject:anObject isNull:YES];
}

- (void)addObject:(id)anObject isNull:(BOOL)isNull
{
    if (anObject) {
        [self addObject:anObject];
        return;
    } else if (isNull) {
        [self addObject:[NSNull null]];
    }
}

#pragma mark - - (void)insertObject:(id)anObject atIndex:(NSUInteger)index

- (void)insertObjectNil:(id)anObject atIndex:(NSUInteger)index
{
    [self insertObject:anObject atIndex:index isNull:NO];
}

- (void)insertObjectNull:(id)anObject atIndex:(NSUInteger)index
{
    [self insertObject:anObject atIndex:index isNull:YES];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index isNull:(BOOL)isNull
{
    if (anObject) {
        [self insertObject:anObject atIndex:index];
        return;
    } else if (isNull) {
        [self insertObject:[NSNull null] atIndex:index];
    }
}

#pragma mark - - (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject

- (void)replaceObjectAtIndex:(NSUInteger)index withObjectNil:(id)anObject
{
    [self replaceObjectAtIndex:index withObject:anObject isNull:NO];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObjectNull:(id)anObject
{
    [self replaceObjectAtIndex:index withObject:anObject isNull:YES];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject isNull:(BOOL)isNull
{
    if (anObject) {
        [self replaceObjectAtIndex:index withObject:anObject];
        return;
    } else if (isNull) {
        [self replaceObjectAtIndex:index withObject:[NSNull null]];
    }
}

@end
