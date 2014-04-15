/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

@protocol NilusAddObject <NSObject>

/**
 * Adds an object. If the object is nil the method has no effect.
 * @param anObject The object to add.
 */
- (void)addObjectNil:(id)anObject;

/**
 * Adds an object. If the object is nil, [NSNull null] will be added.
 * @param anObject The object to add.
 */
- (void)addObjectNull:(id)anObject;

@end


@protocol NilusInsertObjectAtIndex <NSObject>

/**
 * Inserts a given object at a given index. If the object is nil the method has no effect.
 * @param anObject The object to add.
 * @param index The index in the underlying data structure at which to insert anObject. Raises an NSRangeException if index is greater than the number of elements in the underlying data structure.
 */
- (void)insertObjectNil:(id)anObject atIndex:(NSUInteger)index;

/**
 * Inserts a given object at a given index. If the object is nil, [NSNull null] will be inserted.
 * @param anObject The object to add.
 * @param index The index in the underlying data structure at which to insert anObject. Raises an NSRangeException if index is greater than the number of elements in the underlying data structure.
 */
- (void)insertObjectNull:(id)anObject atIndex:(NSUInteger)index;

@end

@protocol NilusReplaceObjectAtIndexWithObject <NSObject>

/**
 * Replaces the object at index with anObject. If anObject is nil the method has no effect.
 * @param index The index of the object to be replaced. Raises an NSRangeException if index is beyond the end of the underlying data structure.
 * @param anObject The object with which to replace the object at index index in the underlying data structure.
 */
- (void)replaceObjectAtIndex:(NSUInteger)index withObjectNil:(id)anObject;

/**
 * Replaces the object at index with anObject. If the object is nil the object at index will be replaced with [NSNull null].
 * @param index The index of the object to be replaced. Raises an NSRangeException if index is beyond the end of the underlying data structure.
 * @param anObject The object with which to replace the object at index index in the underlying data structure.
 */
- (void)replaceObjectAtIndex:(NSUInteger)index withObjectNull:(id)anObject;

@end

@protocol NilusSetObjectForKey <NSObject>

/**
 * Adds a given key-value pair to the dictionary. If anObject is nil the method has no effect.
 * @param anObject The value for aKey. A strong reference to the object is maintained by the dictionary.
 * @param aKey The key for value. The key is copied (using copyWithZone:; keys must conform to the NSCopying protocol). Raises an NSInvalidArgumentException if aKey is nil. If aKey already exists in the dictionary anObject takes its place.
 */
- (void)setObjectNil:(id)anObject forKey:(id < NSCopying >)aKey;

/**
 * Adds a given key-value pair to the dictionary. If anObject is nil it will be replaced with [NSNull null].
 * @param anObject The value for aKey. A strong reference to the object is maintained by the dictionary.
 * @param The key for value. The key is copied (using copyWithZone:; keys must conform to the NSCopying protocol). Raises an NSInvalidArgumentException if aKey is nil. If aKey already exists in the dictionary anObject or [NSNull null] takes its place.
 */
- (void)setObjectNull:(id)anObject forKey:(id < NSCopying >)aKey;

@end
