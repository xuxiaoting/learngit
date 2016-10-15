//
//  CustomCell.m
//  S2-Tableview
//
//  Created by dongdong on 14-8-5.
//  Copyright (c) 2014年 dongdong. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *aa = [[UILabel alloc]init];
        aa.frame = self.bounds;
        aa.text = @"aaaaaa";
        self.aa = aa;
        [aa release];
        [self addSubview:_aa];
    }
    return self;
}

@end
