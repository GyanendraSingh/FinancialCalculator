//
//  RootViewController.h
//  FinancialCalculator
//
//  Created by admin on 1/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController{
    NSArray *calcList;
    NSArray *imgList;
  //  IBOutlet UITableView *tableView;
    
}

@property(strong,nonatomic)NSArray *calcList;
@property(strong,nonatomic)NSArray *imgList;
//@property(strong, nonatomic)IBOutlet UITableView *tableView;

@end
