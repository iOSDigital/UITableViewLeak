//
//  TableLeakController.m
//  TableViewLeak
//
//  Created by Paul Derbyshire on 02/12/2015.
//  Copyright © 2015 iOSDigital. All rights reserved.
//

#import "TableLeakController.h"
#import "TableLeakCell.h"


@interface TableLeakController ()
@property (nonatomic, strong)	NSMutableArray *dataArray;
@property (nonatomic, copy)		NSString *deletedPointerString;
@end



@implementation TableLeakController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.dataArray = [[NSMutableArray alloc] initWithObjects:@"Louise",@"Gary",@"Lucy",@"Paul",@"Chris",@"Peter", nil];
}

-(void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self.tableView endEditing:YES];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leakCell" forIndexPath:indexPath];
    
	cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

 
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		
		TableLeakCell *deletedCell = [tableView cellForRowAtIndexPath:indexPath];
		[self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
		
		if ([self.delegate respondsToSelector:@selector(tableLeakControllerDeletedCell:)]) {
			[self.delegate tableLeakControllerDeletedCell:deletedCell];
		}
		
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
		
    }
}








- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

-(void)dealloc {
	NSLog(@"TableLeakController dealloc");
}

@end
