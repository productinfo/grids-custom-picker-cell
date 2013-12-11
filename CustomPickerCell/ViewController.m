//
//  ViewController.m
//  CustomPickerCell
//
//  Created by Alison Clarke on 20/11/2013.
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

#import "ViewController.h"
#import "PersonDataObject.h"
#import "PersonDataSource.h"
#import "PickerCell.h"

@interface ViewController ()
{
    NSArray* _data;
    SDataGridDataSourceHelper* _datasourceHelper;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSLog(@"Shinobi version: %@", [_shinobiDataGrid getInfo]);
    
    _shinobiDataGrid.singleTapEventMask = SDataGridEventEdit;
    
    // Set up the license key if you're using the trial version
    _shinobiDataGrid.licenseKey = @""; // TODO: add your trial licence key here!
    
    // Add a title column, with the custom PickerCell type
    SDataGridColumn* titleColumn = [[SDataGridColumn alloc] initWithTitle:@"Title" forProperty:@"title"];
    titleColumn.editable = YES;
    titleColumn.cellType = [PickerCell class];
    [_shinobiDataGrid addColumn:titleColumn];
    
    // Add a forename column
    SDataGridColumn* forenameColumn = [[SDataGridColumn alloc] initWithTitle:@"Forename" forProperty:@"forename"];
    forenameColumn.editable = YES;
    [_shinobiDataGrid addColumn:forenameColumn];
    
    // Add a surname column
    SDataGridColumn* surnameColumn = [[SDataGridColumn alloc] initWithTitle:@"Surname" forProperty:@"surname"];
    surnameColumn.editable = YES;
    [_shinobiDataGrid addColumn:surnameColumn];
    
    // Create some data to populate the grid
    _data = [PersonDataSource generatePeople:20];
    
    // Create the data source helper and set its delegate and data
    _datasourceHelper = [[SDataGridDataSourceHelper alloc] initWithDataGrid:_shinobiDataGrid];
    _datasourceHelper.delegate = self;
    _datasourceHelper.data = _data;
    
    // Set the grid's delegate
    _shinobiDataGrid.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SDataGridDataSourceHelperDelegate methods

// Called when the data source helper is populating a cell
- (BOOL)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper populateCell:(SDataGridCell *)cell withValue:(id)value forProperty:(NSString *)propertyKey sourceObject:(id)object
{
    if ([propertyKey isEqualToString:@"title"])
    {
        // Create a picker cell to display the title property
        PickerCell* pickerCell = (PickerCell*)cell;
        pickerCell.dataGrid = _shinobiDataGrid;
        pickerCell.values = [PersonDataObject titleDisplayNames];
        pickerCell.selectedIndex = [value integerValue];
        
        return YES;
    }
    
    // Return 'NO' so that the datasource helper populates all the other cells in the grid.
    return NO;
}

#pragma mark - SDataGridDelegate methods

// Called when a cell within the ShinobiDataGrid object has been edited.
- (void)shinobiDataGrid:(ShinobiDataGrid *)grid didFinishEditingCellAtCoordinate:(SDataGridCoord *)coordinate
{
    // Find the cell that was edited (all our cells are SDataGridTextCells)
    SDataGridCell* cell = (SDataGridCell*)[_shinobiDataGrid visibleCellAtCoordinate:coordinate];
    
    // Locate the 'model' object for this row
    PersonDataObject* person = _data[coordinate.row.rowIndex];
    
    // Determine which column this cell belongs to
    if ([cell.coordinate.column.title isEqualToString:@"Title"])
    {
        // The title column uses our custom picker cell
        PickerCell* pickerCell = (PickerCell*) cell;
        
        // Retrieve the selected index from the picker cell, which will map directly to a PersonTitle
        int title = pickerCell.selectedIndex;
        
        if (PersonDataObjectIsValidTitle(title)) {
            person.title = pickerCell.selectedIndex;
        } else {
            pickerCell.selectedIndex = person.title;
        }
    } else {
        SDataGridTextCell *textCell = (SDataGridTextCell*) cell;
        
        if ([cell.coordinate.column.title isEqualToString:@"Forename"])
        {
            person.forename = textCell.textField.text;
        }
        if ([cell.coordinate.column.title isEqualToString:@"Surname"])
        {
            person.surname = textCell.textField.text;
        }
    }
    
}

@end
