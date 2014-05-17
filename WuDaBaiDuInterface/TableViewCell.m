//
//  TableViewCell.m
//  WuDaBaiDuInterface
//
//  Created by 杨超 on 14-5-14.
//  Copyright (c) 2014年 杨 超. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
