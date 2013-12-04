//
//  PersonDataObject.m
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

#import "PersonDataObject.h"

@implementation PersonDataObject

// Creates and returns a PersonDataObject with the given data
+ (PersonDataObject*) personWithTitle:(PersonTitle)title surname:(NSString*)surname forename:(NSString*)forename
{
    PersonDataObject* obj = [[PersonDataObject alloc] init];
    obj.title = title;
    obj.forename = forename;
    obj.surname = surname;
    return obj;
}

// Returns an array of title display names whose indices map to the PersonTitle enum
+ (NSArray *)titleDisplayNames
{
    return @[@"Mr", @"Mrs", @"Miss", @"Ms", @"Dr"];
}

// Returns the display name for this person's title, if the title is a valid PersonTitle, otherwise returns NULL
- (NSString *)titleDisplayName
{
    if (PersonDataObjectIsValidTitle(self.title))
    {
        return [[self class] titleDisplayNames][self.title];
    }
    return NULL;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@ ", [self titleDisplayName], _forename, _surname];
}

@end
