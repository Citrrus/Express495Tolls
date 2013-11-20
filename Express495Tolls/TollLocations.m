//
//  TollLocations.m
//  Express495Tolls
//
//  Created by Matt Bowman on 11/20/13.
//  Copyright (c) 2013 Citrrus, LLC. All rights reserved.
//

#import "TollLocations.h"
#import <Mantle.h>
#import "TollLocation.h"

@implementation TollLocations

+ (NSArray*)tollData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tolldata" ofType:@"json"];
    NSError *error;
    NSArray *data = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                         options:kNilOptions
                                                           error:&error];

    if (error)
    {
        NSLog(@"Error: %@", error);
        return nil;
    }

    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:data.count];
    
    for (NSDictionary *d in data)
    {
        NSError *e;
        [newArray addObject:[MTLJSONAdapter modelOfClass:[TollLocation class] fromJSONDictionary:d error:&e]];
        if (e)
        {
            NSLog(@"Error: %@", e);
        }
    }
    
    return newArray;
}

@end
