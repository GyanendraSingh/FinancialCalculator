//
//  SavingCalculator.h
//  FinancialCalculator
//
//  Created by admin on 1/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavingCalculator : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    IBOutlet UIPickerView * tipPicker;
    NSString *selectedF;
    NSArray *frequency;
}
@property(strong, nonatomic)NSString *selectedF;
@property (strong,nonatomic)NSArray *frequency;
@end
