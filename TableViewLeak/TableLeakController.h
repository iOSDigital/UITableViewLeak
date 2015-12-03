//
//  TableLeakController.h
//  TableViewLeak
//
//  Created by Paul Derbyshire on 02/12/2015.
//  Copyright © 2015 iOSDigital. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableLeakControllerDelegate;


@interface TableLeakController : UITableViewController {
	
}

@property (nonatomic, weak) id<TableLeakControllerDelegate> delegate;

@end



@protocol TableLeakControllerDelegate <NSObject>
@optional
-(void)tableLeakControllerDeletedCell:(UITableViewCell *)cell;
@end