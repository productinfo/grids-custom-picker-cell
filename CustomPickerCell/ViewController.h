//
//  ViewController.h
//  CustomPickerCell
//
//  Created by Alison Clarke on 20/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShinobiGrids/ShinobiDataGrid.h>

@interface ViewController : UIViewController<SDataGridDelegate, SDataGridDataSourceHelperDelegate>

@property (weak, nonatomic) IBOutlet ShinobiDataGrid *shinobiDataGrid;

@end
