//
//  LSPartitions.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSPartition;

@interface LSPartitions : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *lives;
@property (nonatomic, strong) LSPartition *partition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
