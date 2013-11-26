//
//  PickerCell.h
//  CustomPickerCell
//
//  Created by Alison Clarke on 25/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
//

#import <ShinobiGrids/ShinobiDataGrid.h>
#import "PickerViewController.h"

/**
 PickerCell subclasses SDataGridCell to display a UIPicker inside a popover when in edit mode
 */
@interface PickerCell : SDataGridTextCell<PickerDelegate>

@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, strong) NSArray* values;
@property (nonatomic, strong) ShinobiDataGrid* dataGrid;

@end
