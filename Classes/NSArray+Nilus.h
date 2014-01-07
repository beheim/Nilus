/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <Foundation/Foundation.h>

@interface NSArray (Nilus)

/**
 * Creates and returns a (possibly empty) array.
 * @param anObject An object.
 * @return An array containing the single element anObject if it is not nil or an empty array.
 */
+ (instancetype)arrayWithObjectNil:(id)anObject;

/**
 * Creates and returns an array. If anObject is nil, it will be replaced with [NSNull null].
 * @param anObject An object.
 * @return An array containing the single element anObject if it is not nil or an array containing [NSNull null].
 */
+ (instancetype)arrayWithObjectNull:(id)anObject;

/**
 * Creates and returns an array using n objects. Each object being nil will be skipped.
 * @param objects A c-array. E.g.: id c_array[] = { obj0, obj1, nil, obj3 };
 * @param size Use sizeof(c_array).
 * @return An array with maximum of n objects. E.g.: @[obj0, obj1, obj3]
 */
+ (instancetype)arrayWithObjectsNil:(const id[])objects size:(size_t)size;

/**
 * Creates and returns an array using n objects. Each object being nil will be replaced with [NSNull null].
 * @param objects A c-array. E.g.: id c_array[] = { obj0, obj1, nil, obj3 };
 * @param size Use sizeof(c_array).
 * @return An array with n objects. E.g.: @[obj0, obj1, [NSNull null], obj3]
 */
+ (instancetype)arrayWithObjectsNull:(const id[])objects size:(size_t)size;

/**
 * Returns a new array that is a copy of the receiving array with a given object added to the end.
 * If anObject is nil, a copy of the array will be returned.
 * @param anObject An object.
 * @return A new array that is a copy of the receiving array with anObject added to the end if it is not nil.
 */
- (NSArray *)arrayByAddingObjectNil:(id)anObject;

/**
 * Returns a new array that is a copy of the receiving array with a given object added to the end.
 * If anObject is nil, [NSNull null] will be added instead.
 * @param anObject An object.
 * @return A new array that is a copy of the receiving array with anObject added to the end if it is not nil or otherwise [NSNull null].
 */
- (NSArray *)arrayByAddingObjectNull:(id)anObject;

@end
