//
//  RootViewController.m
//  FinancialCalculator
//
//  Created by admin on 1/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "DetailViewController.h"
#import "InflationCalculator.h"
#import "SavingCalculator.h"
#import "RetirementCalculator.h"
#import "HomeloanCalculator.h"


@implementation RootViewController
@synthesize calcList;
@synthesize  imgList;
//@synthesize tableView;

InflationCalculator *inflcalc;
RetirementCalculator *retcalc;
SavingCalculator *savcalc;
HomeloanCalculator *homecalc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Financial Calculator", @"Financial Calculator");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
  //  tableView.rowHeight= 80;
    
    calcList=[[NSArray alloc]initWithObjects:@"Inflation Calculator",@"Homeloan Calculator", @"Saving Calculator", @"Retirement Calculator", nil];
    
    imgList=[[NSArray alloc]initWithObjects:@"inflation.jpeg",@"homeloan.jpeg",@"saving.jpeg",@"retirement.jpeg", nil];
	// Do any additional setup after loading the view, typically from a nib.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        if(indexPath.row==0 &&indexPath.section==0){
            cell.textLabel.text=@"Inflation Calculator";
            cell.imageView.image=[UIImage imageNamed:@"inflation.jpeg"];
        }
        if(indexPath.row==0 && indexPath.section==1){
            cell.textLabel.text=@"Homeloan Calculator";
            cell.imageView.image=[UIImage imageNamed:@"homeloan.jpeg"];
            
        }
        
        if(indexPath.row==0 && indexPath.section==2){
            cell.textLabel.text=@"Saving Calculator";
            cell.imageView.image=[UIImage imageNamed:@"saving.jpeg"];
        }
        
        if(indexPath.row==0 && indexPath.section==3){
            cell.textLabel.text=@"Retirement Calculator";
            cell.imageView.image=[UIImage imageNamed:@"retirement.jpeg"];
        }

    }

    // Configure the cell.
    //cell.textLabel.text = [self.calcList objectAtIndex:[indexPath row]];
    //cell.imageView.image=[UIImage imageNamed:[self.imgList objectAtIndex:[indexPath row]]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   NSString *selected=[imgList objectAtIndex:[indexPath row]];
    if([selected isEqualToString:@"inflation.jpeg"]){
    
        InflationCalculator *inflationCalculator= [[InflationCalculator alloc] initWithNibName:@"inflation" bundle:nil];
        // Pass the selected object to the new view controller.
        [self.navigationController pushViewController:inflationCalculator animated:YES];
    } 
    
    if([selected isEqualToString:@"homeloan.jpeg"]){
        
            HomeloanCalculator *homelaon = [[HomeloanCalculator alloc] initWithNibName:@"homeloan" bundle:nil];
            // Pass the selected object to the new view controller.
            [self.navigationController pushViewController:homelaon animated:YES];

    }
    
    if([selected isEqualToString:@"saving.jpeg"]){
            SavingCalculator *savingCalc = [[SavingCalculator alloc] initWithNibName:@"saving" bundle:nil];
            // Pass the selected object to the new view controller.
            [self.navigationController pushViewController:savingCalc animated:YES];

    }

    if([selected isEqualToString:@"retirement.jpeg"]){
            RetirementCalculator *retcalc = [[RetirementCalculator alloc] initWithNibName:@"retirement" bundle:nil];
            // Pass the selected object to the new view controller.
        retcalc.title=@"Retirement Calculator";
        [self.navigationController pushViewController:retcalc animated:YES];
         
        
    }


}
@end
