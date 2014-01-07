/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <Foundation/Foundation.h>

@interface NSMutableArray (Nilus)

/**
 * Inserts a given object at the end of the array if the object is not nil. If the object is nil the method has no effect.
 * @param anObject The object to add to the end of the array's content.
 */
- (void)addObjectNil:(id)anObject;

/**
 * Inserts a given object at the end of the array if the object is not nil. If the object is nil [NSNull null] will be inserted.
 * @param anObject The object to add to the end of the array's content.
 */
- (void)addObjectNull:(id)anObject;

/**
 * Inserts a given object into the array's contents at a given index if the object is not nil. If the object is nil the method has no effect.
 *
 * If index is already occupied, the objects at index and beyond are shifted by adding 1 to their indices to make room.
 *
 * @exception NSRangeException Raises an NSRangeException if index is greater than the number of elements in the array.
 * @param anObject The object to add to the end of the array's content.
 * @param index The index in the array at which to insert anObject. This value must not be greater than the count of elements in the array.
 */
- (void)insertObjectNil:(id)anObject atIndex:(NSUInteger)index;

/**
 * Inserts a given object into the array's contents at a given index if the object is not nil. If the object is nil [NSNull null] will be inserted.
 *
 * If index is already occupied, the objects at index and beyond are shifted by adding 1 to their indices to make room.
 *
 * @exception NSRangeException Raises an NSRangeException if index is greater than the number of elements in the array.
 * @param anObject The object to add to the end of the array's content.
 * @param index The index in the array at which to insert anObject. This value must not be greater than the count of elements in the array.
 */
- (void)insertObjectNull:(id)anObject atIndex:(NSUInteger)index;

/**
 * Replaces the object at index with anObject. If anObject is nil the method has no effect.
 *
 * @exception NSRangeException Raises an NSRangeException if index is beyond the end of the array.
 * @param index The index of the object to be replaced. This value must not exceed the bounds of the array.
 * @param anObject The object with which to replace the object at index index in the array.
 */
- (void)replaceObjectAtIndex:(NSUInteger)index withObjectNil:(id)anObject;

/**
 * Replaces the object at index with anObject. If the object is nil the object at index will be replaced with [NSNull null].
 *
 * @exception NSRangeException Raises an NSRangeException if index is beyond the end of the array.
 * @param index The index of the object to be replaced. This value must not exceed the bounds of the array.
 * @param anObject The object with which to replace the object at index index in the array.
 */
- (void)replaceObjectAtIndex:(NSUInteger)index withObjectNull:(id)anObject;

@end
