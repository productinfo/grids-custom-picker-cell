//
//  ViewController.m
//  CustomPickerCell
//
//  Created by Alison Clarke on 20/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
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
    SDataGridTextCell* cell = (SDataGridTextCell*)[_shinobiDataGrid visibleCellAtCoordinate:coordinate];
    
    // Locate the 'model' object for this row
    PersonDataObject* person = _data[coordinate.row.rowIndex];
    
    // Determine which column this cell belongs to
    if ([cell.coordinate.column.title isEqualToString:@"Forename"])
    {
        person.forename = cell.textField.text;
    }
    if ([cell.coordinate.column.title isEqualToString:@"Surname"])
    {
        person.surname = cell.textField.text;
    }
    if ([cell.coordinate.column.title isEqualToString:@"Title"])
    {
        // The title column uses our custom picker cell
        PickerCell* pickerCell = (PickerCell*) cell;
        // Retrieve the selected index from the picker cell, which will map directly to a PersonTitle
        int title = pickerCell.selectedIndex;
        
        if (PersonDataObjectIsValidTitle(title)) {
            person.title = pickerCell.selectedIndex;
        } else {
            pickerCell.textField.text = person.titleDisplayName;
        }
    }
}

@end
