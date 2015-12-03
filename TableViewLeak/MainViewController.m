//
//  MainViewController.m
//  TableViewLeak
//
//  Created by Paul Derbyshire on 02/12/2015.
//  Copyright © 2015 iOSDigital. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic, weak) TableLeakController *tableController;
@end



@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	self.tableController = segue.destinationViewController;
	self.tableController.delegate = self;
}



-(void)tableLeakControllerDeletedCell:(UITableViewCell *)cell {
	NSLog(@"-");
	NSLog(@"TableLeakController deleted cell with pointer address: %lu (%@)",(uintptr_t)cell, [cell.textLabel.text copy]);
	NSLog(@"Now go back, pause execution, and type 'po %lu' into the debugger",(uintptr_t)cell);
	NSLog(@"All the other cells with have dealloc'ed. Why hasn't the deleted one...?");
	NSLog(@"-");
}


@end
