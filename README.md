Nilus
=========
A category on NS(Mutable)Array and NS(Mutable)Dictionary for handling nil objects.

## Motivation
Consider the following objects defined somewhere. They could be anything including nil.
```objective-c
  NSString *obj0 = @"0";
  id        obj1 = nil;
  NSNumber *obj2 = @2;
  id        obj3 = nil;
```
```objective-c
  // Transform them into an array. Without prior nil-checking and using old arrayWithObjects:
  NSLog(@"%@", [NSArray arrayWithObjects:obj0, obj1, obj2, obj3, nil]);
> ( 0 ) // obj1 terminates the list with nil. Ouch!

  // Now let's do the same using literals:
  NSLog(@"%@", @[obj0, obj1, obj2, obj3]);
> CRASH // Ouch!

  // Prior nil-checking would mean:
  NSMutableArray *mutableArray = [NSMutableArray array];
  if (obj0) [mutableArray addObject:obj0];
  if (obj1) [mutableArray addObject:obj1];
  if (obj2) [mutableArray addObject:obj2];
  if (obj3) [mutableArray addObject:obj3];
  
  // Or transforming nil into [NSNull null]:
  mutableArray = [NSMutableArray array];
  if (obj0) [mutableArray addObject:obj0]; else [mutableArray addObject:[NSNull null]];
  if (obj1) [mutableArray addObject:obj1]; else [mutableArray addObject:[NSNull null]];
  if (obj2) [mutableArray addObject:obj2]; else [mutableArray addObject:[NSNull null]];
  if (obj3) [mutableArray addObject:obj3]; else [mutableArray addObject:[NSNull null]];
  
```
Nilus can do the same in two lines. It can skip nil objects or transform them into `[NSNull null]` using `arrayWithObjectsNil` or `arrayWithObjectsNull`.
```objective-c
  id objs[] = { obj0, obj1, obj2, obj3 };
  NSLog(@"%@", [NSArray arrayWithObjectsNil:objs size:sizeof(objs)]);
> ( 0, 2 )
  NSLog(@"%@", [NSArray arrayWithObjectsNull:objs size:sizeof(objs)]);
> ( 0, "<null>", 2, "<null>" )
```

Also, it is now easy to skip nil-objects or insert `[NSNull null]`s for them.
```objective-c
  id obj = ...;
  [mutableArray addObjectNil:obj]  // nothing will happen if obj is nil
  [mutableArray addObjectNull:obj] // [NSNull null] will be added if obj is nil
```

Same applies to dictionaries. All methods under Usage.

## Usage
All methods perform nil-checking before passing the objects down to the default implementations. Check the `.h` files for detailed documentation, which is also Xcode quick help compliant.
 - In case the object supplied is nil:
  - Using methods suffixed with `Nil` will skip the object.
  - Using methods suffixed with `Null` will transform the object into `[NSNull null]`.
 - All functions return a NEW array/dictionary. They will never return nil, but an empty array/dictionary.
 
Following functions and methods are suffixed with `Nil` or `Null`.
```objective-c
  // NSArray
  + (instancetype)arrayWithObject:(id)anObject        // Default
  + (instancetype)arrayWithObjectNil:(id)anObject     // Nilus
  + (instancetype)arrayWithObjectNull:(id)anObject    // Nilus
  
  + (instancetype)arrayWithObjects:(id)firstObj,,...                          // Default
  + (instancetype)arrayWithObjectsNil:(const id[])objects size:(size_t)size   // Nilus
  + (instancetype)arrayWithObjectsNull:(const id[])objects size:(size_t)size  // Nilus
  
  - (NSArray *)arrayByAddingObject:(id)anObject       // Default
  - (NSArray *)arrayByAddingObjectNil:(id)anObject    // Nilus
  - (NSArray *)arrayByAddingObjectNull:(id)anObject   // Nilus

  // NSMutableArray
  - (void)addObject:(id)anObject        // Default
  - (void)addObjectNil:(id)anObject     // Nilus
  - (void)addObjectNull:(id)anObject    // Nilus

  - (void)insertObject:(id)anObject atIndex:(NSUInteger)index       // Default
  - (void)insertObjectNil:(id)anObject atIndex:(NSUInteger)index    // Nilus
  - (void)insertObjectNull:(id)anObject atIndex:(NSUInteger)index   // Nilus
  
  - (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject      // Default
  - (void)replaceObjectAtIndex:(NSUInteger)index withObjectNil:(id)anObject   // Nilus
  - (void)replaceObjectAtIndex:(NSUInteger)index withObjectNull:(id)anObject  // Nilus
  
  // NSDictionary
  + (instancetype)dictionaryWithObject:(id)anObject forKey:(id<NSCopying>)aKey     // Default
  + (instancetype)dictionaryWithObjectNil:(id)anObject forKey:(id<NSCopying>)aKey  // Nilus
  + (instancetype)dictionaryWithObjectNull:(id)anObject forKey:(id<NSCopying>)aKey // Nilus
  
  + (instancetype)dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count     // Default
  + (instancetype)dictionaryWithObjectsNil:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count  // Nilus
  + (instancetype)dictionaryWithObjectsNull:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count // Nilus
  
  // NSMutableDictionary
  - (void)setObject:(id)anObject forKey:(id < NSCopying >)aKey     // Default
  - (void)setObjectNil:(id)anObject forKey:(id < NSCopying >)aKey  // Nilus
  - (void)setObjectNull:(id)anObject forKey:(id < NSCopying >)aKey // Nilus

```

You should always know what you are doing when using these methods. Errors may vanish silently...

## Installation
Requires ARC. Just import `Nilus.h` after installing via pods or manually.
### CocoaPods
```ruby
pod 'Nilus'
```

### Manual
Copy the files in the `Classes` directory into your project.

## Tests
Tests are under `NilusTests/NilusTests.m`.

## License
> The MIT License (MIT)

> Copyright (c) 2014 Masashi Beheim

> Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

> The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
