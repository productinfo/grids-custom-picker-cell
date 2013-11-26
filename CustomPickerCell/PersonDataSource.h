//
//  PersonDataSource.h
//  CustomPickerCell
//
//  Created by Alison Clarke on 25/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonDataSource : NSObject

// Generates a random array of PersonDataObjects
+ (NSArray*)generatePeople:(NSUInteger)peopleCount;

@end
