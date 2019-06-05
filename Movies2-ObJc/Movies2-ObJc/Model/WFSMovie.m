//
//  WFSMovie.m
//  Movies2-ObJc
//
//  Created by winston salcedo on 6/2/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import "WFSMovie.h"

@implementation WFSMovie

-(instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating overview:(NSString *)overview
{
    self = [super init];
    if (self) {
        _title = title;
        _rating = rating;
        _overview = overview;
    }
    return self;
}
@end

@implementation WFSMovie (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSDictionary *data = dictionary [@"data"];
    NSString *title = data[@"title"];
    NSNumber *rating = data[@"popularity"];
    NSString *overview = data[@"overview"];
    
    return[self initWithTitle:title rating:rating overview:overview];
}
@end
