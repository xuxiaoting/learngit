//
//  Shop.h
//  S2-Tableview
//
//  Created by dongdong on 14-8-2.
//  Copyright (c) 2014年 dongdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic,retain) NSString *icon;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *desc;

+(id)shopWithName:(NSString *)name icon:(NSString *)icon desc:(NSString *)desc;


@end
