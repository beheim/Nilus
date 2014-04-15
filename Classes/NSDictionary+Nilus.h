/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <Foundation/Foundation.h>
#import "NilusProtocols.h"

@interface NSDictionary (Nilus)

/**
 * Creates and returns a dictionary containing a given key and value.
 * @param anObject The value corresponding to aKey. Can be nil.
 * @param aKey The key for anObject. If aKey is nil and anObject is not nil, an NSInvalidArgumentException is raised.
 * @return A new dictionary containing a single object, anObject, for a single key, aKey. If anObject is nil, an empty dictionary will be returned.
 */
+ (instancetype)dictionaryWithObjectNil:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 * Creates and returns a dictionary containing a given key and value.
 * @param anObject The value corresponding to aKey. Can be nil.
 * @param aKey The key for anObject. If this value is nil, an NSInvalidArgumentException is raised.
 * @return A new dictionary containing a single object, anObject, for a single key, aKey. If anObject is nil, the single object is [NSNull null].
 */
+ (instancetype)dictionaryWithObjectNull:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 * Creates and returns a dictionary containing maximal count objects from the objects array. Nil objects will be skipped.
 * @param objects A C array of values for the new dictionary.
 * @param keys A C array of keys for the new dictionary. Each key is copied (using copyWithZone:; keys must conform to the NSCopying protocol), and the copy is added to the new dictionary.
 * @param count The number of elements to use from the keys and objects arrays. count must not exceed the number of elements in objects or keys.
 */
+ (instancetype)dictionaryWithObjectsNil:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count;

/**
 * Creates and returns a dictionary containing count objects from the objects array. Nil objects will be replaced with [NSNull null].
 * @param objects A C array of values for the new dictionary.
 * @param keys A C array of keys for the new dictionary. Each key is copied (using copyWithZone:; keys must conform to the NSCopying protocol), and the copy is added to the new dictionary.
 * @param count The number of elements to use from the keys and objects arrays. count must not exceed the number of elements in objects or keys.
 */
+ (instancetype)dictionaryWithObjectsNull:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count;

@end
