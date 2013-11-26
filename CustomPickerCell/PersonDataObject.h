//
//  PersonDataObject.h
//  CustomPickerCell
//
//  Created by Alison Clarke on 25/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
//

#import <Foundation/Foundation.h>

// A simple data object that represents a person
@interface PersonDataObject : NSObject

// Enum of possible titles
typedef NS_ENUM(NSUInteger, PersonTitle) {
    PersonTitleMr = 0,
    PersonTitleMrs,
    PersonTitleMiss,
    PersonTitleMs,
    PersonTitleDr
};

#define PersonDataObjectIsValidTitle(title)\
    (title == PersonTitleMr ||\
     title == PersonTitleMrs ||\
     title == PersonTitleMiss ||\
     title == PersonTitleMs ||\
     title == PersonTitleDr)

@property (nonatomic) PersonTitle title;
@property (strong, nonatomic) NSString* surname;
@property (strong, nonatomic) NSString* forename;

+ (PersonDataObject*) personWithTitle:(PersonTitle)title surname:(NSString*)surname forename:(NSString*)forename;
+ (NSArray *)titleDisplayNames;
- (NSString *)titleDisplayName;
- (NSString *)description;

@end
