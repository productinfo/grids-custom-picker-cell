//
//  PickerCell.m
//  CustomPickerCell
//
//  Created by Alison Clarke on 25/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
//

#import "PickerCell.h"
#import "PickerViewController.h"

@implementation PickerCell
{
    PickerViewController* _pickerViewController;
    UIPopoverController* _popover;
}

- (id)initWithReuseIdentifier:(NSString *)identifier
{
    if (self = [super initWithReuseIdentifier:identifier]) {
        // Create a PickerViewController ready to display when in edit mode
        _pickerViewController = [[PickerViewController alloc] init];
        _pickerViewController.delegate = self;
    }
    return self;
}

- (void) setValues:(NSArray*)values
{
    // Sets the list of possible values for the cell
    _values = values;
    // Pass the list to the PickerViewController
    [_pickerViewController setValues:values];
}

- (void) setSelectedIndex:(int)selectedIndex
{
    // Check the index is in the bounds of our values array
    if ([_values count] > selectedIndex)
    {
        // Set the selected index, and pass it to the PickerViewController
        _selectedIndex = selectedIndex;
        _pickerViewController.selectedIndex = selectedIndex;
    
        // Update the displayed text with the new value
        self.textField.text = [_values[selectedIndex] description];
    }
}

#pragma mark PickerDelegate methods

// Called when the a new value has been selected in the UIPickerView
-(void)didSelectRowAtIndex:(int)newIndex {
    // Set the the new index value
    [self setSelectedIndex:newIndex];
    
    // Dismiss the popover
    [_popover dismissPopoverAnimated:YES];
    _popover = nil;
    
    // Call the didFinishEditingCellAtCoordinate method on the grid's delegate (if the method exists)
    if ([self.dataGrid.delegate respondsToSelector:@selector(shinobiDataGrid:didFinishEditingCellAtCoordinate:)]) {
        [self.dataGrid.delegate shinobiDataGrid:self.dataGrid didFinishEditingCellAtCoordinate:self.coordinate];
    }
}

#pragma mark SGridEventResponder Protocol Methods

// Called when the grid's edit event is triggered on this cell
- (void) actUponEditEvent {
    [self respondToEditEvent];
}

- (void) respondToEditEvent {
    // Override the text cell's default edit response (showing the keyboard) and show a picker popover instead
    _popover = [[UIPopoverController alloc] initWithContentViewController:_pickerViewController];
    [_popover presentPopoverFromRect:self.bounds inView:self permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

@end
