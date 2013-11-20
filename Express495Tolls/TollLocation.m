//
//  TollLocation.m
//  Express495Tolls
//
//  Created by Matt Bowman on 11/20/13.
//  Copyright (c) 2013 Citrrus, LLC. All rights reserved.
//

#import "TollLocation.h"
#import <Mantle.h>

@implementation TollLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSValueTransformer *)directionJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @NO: @"N",
                                                                           @"S": @"S"
                                                                           }];
}

@end
