//
//  LSPartition.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSSubIcon;

@interface LSPartition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double partitionIdentifier;
@property (nonatomic, strong) LSSubIcon *subIcon;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double count;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
