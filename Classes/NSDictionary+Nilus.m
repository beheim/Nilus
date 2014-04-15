/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSDictionary+Nilus.h"

@implementation NSDictionary (Nilus)

#pragma mark - + (instancetype)dictionaryWithObject:(id)anObject forKey:(id<NSCopying>)aKey

+ (instancetype)dictionaryWithObjectNil:(id)anObject forKey:(id<NSCopying>)aKey
{
    return [self dictionaryWithObject:anObject forKey:aKey isNull:NO];
}

+ (instancetype)dictionaryWithObjectNull:(id)anObject forKey:(id<NSCopying>)aKey
{
    return [self dictionaryWithObject:anObject forKey:aKey isNull:YES];
}

+ (instancetype)dictionaryWithObject:(id)anObject forKey:(id<NSCopying>)aKey isNull:(BOOL)isNull
{
    if (anObject) {
        return [NSDictionary dictionaryWithObject:anObject forKey:aKey];
    } else if (isNull) {
        return [NSDictionary dictionaryWithObject:[NSNull null] forKey:aKey];
    }
    return [NSDictionary dictionary];
}

#pragma mark - + (instancetype)dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count

+ (instancetype)dictionaryWithObjectsNil:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count
{
    return [self dictionaryWithObjects:objects forKeys:keys count:count isNull:NO];
}

+ (instancetype)dictionaryWithObjectsNull:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count
{
    return [self dictionaryWithObjects:objects forKeys:keys count:count isNull:YES];
}

+ (instancetype)dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count isNull:(BOOL)isNull
{
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:count];
    for (NSUInteger i = 0; i < count; i++) {
        id object = objects[i];
        id key = [(id)keys[i] copy];
        if (object) {
            [result setObject:object forKey:key];
        } else if (isNull) {
            [result setObject:[NSNull null] forKey:key];
        }
    }
    return [result copy];
}

@end
