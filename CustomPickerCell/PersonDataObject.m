//
//  PersonDataObject.m
//  CustomPickerCell
//
//  Created by Alison Clarke on 25/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
//

#import "PersonDataObject.h"

@implementation PersonDataObject

// Returns an array of title display names whose indices map to the PersonTitle enum
+ (NSArray *)titleDisplayNames
{
    return @[@"Mr", @"Mrs", @"Miss", @"Ms", @"Dr"];
}

// Creates and returns a PersonDataObject with the given data
+ (PersonDataObject*) personWithTitle:(PersonTitle)title surname:(NSString*)surname forename:(NSString*)forename
{
    PersonDataObject* obj = [[PersonDataObject alloc] init];
    obj.title = title;
    obj.forename = forename;
    obj.surname = surname;
    return obj;
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
