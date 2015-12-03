//
//  TableLeakCell.m
//  TableViewLeak
//
//  Created by Paul Derbyshire on 02/12/2015.
//  Copyright © 2015 iOSDigital. All rights reserved.
//

#import "TableLeakCell.h"

@implementation TableLeakCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)dealloc {
	NSLog(@"TableLeakCell dealloc: %lu (%@)", (uintptr_t)self, [self.textLabel.text copy]);
}

@end

