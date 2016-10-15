//
//  Shop.m
//  S2-Tableview
//
//  Created by dongdong on 14-8-2.
//  Copyright (c) 2014年 dongdong. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+(id)shopWithName:(NSString *)name icon:(NSString *)icon desc:(NSString *)desc{
    Shop *shop = [[[Shop alloc] init] autorelease];
    shop.icon = icon;
    shop.name = name;
    shop.desc = desc;
    
    return shop;
}


@end
