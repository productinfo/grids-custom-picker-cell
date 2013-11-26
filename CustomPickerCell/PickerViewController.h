//
//  PickerViewHelper.h
//  CustomPickerCell
//
//  Created by Alison Clarke on 26/11/2013.
//  Copyright (c) 2013 Alison Clarke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PickerDelegate <NSObject>
@required
-(void)didSelectRowAtIndex:(int)newIndex;
@end

@interface PickerViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, strong) NSArray* values;
@property (nonatomic, weak) id<PickerDelegate> delegate;

@end
