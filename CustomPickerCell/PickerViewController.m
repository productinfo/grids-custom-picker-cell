//
//  PickerViewHelper.m
//  CustomPickerCell
//
//  Created by Alison Clarke on 26/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
//

#import "PickerViewController.h"

@implementation PickerViewController
{
    UIPickerView *_pickerView;
    CGFloat largestLabelWidth;
}

- (void)loadView
{
    // Create and set up a UIPickerView if it hasn't already been created
    if (_pickerView == NULL)
    {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.frame = CGRectMake(0, 0, 150, _pickerView.frame.size.height);
        
        // Select the row matching _selectedIndex
        [_pickerView selectRow:_selectedIndex inComponent:0 animated:NO];
    }
    
    // Set our view to be _pickerView
    self.view = _pickerView;
    // Set our preferred size to that of our picker view
    self.preferredContentSize = _pickerView.frame.size;
}

#pragma mark UIPickerViewDataSource methods

// Returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// Returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [_values count];
}

#pragma mark UIPickerViewDelegate methods

// Returns the display value for the relevant row
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_values[row] description];
}

// Called when the user selects a row
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // Call our PickerDelegate's selectedIndex method
    if (_delegate != nil) {
        [_delegate didSelectRowAtIndex:row];
    }
}

@end
