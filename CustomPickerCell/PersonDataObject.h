//
//  PersonDataObject.h
//  CustomPickerCell
//
//  Created by Alison Clarke on 25/11/2013.
//
//  Copyright 2013 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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
