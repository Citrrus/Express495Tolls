//
//  TollLocation.h
//  Express495Tolls
//
//  Created by Matt Bowman on 11/20/13.
//  Copyright (c) 2013 Citrrus, LLC. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

@interface TollLocation : MTLModel <MTLJSONSerializing>

//@property (nonatomic)double longitude;
//@property (nonatomic)double latitude;
@property (nonatomic)BOOL closest;
@property (nonatomic, copy)NSString *tmsName;
@property (nonatomic, copy)NSString *direction;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *desc;
@property (nonatomic)NSInteger entryID;

@end
