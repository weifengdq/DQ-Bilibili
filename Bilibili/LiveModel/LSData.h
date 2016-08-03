//
//  LSData.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LSData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *banner;
@property (nonatomic, strong) NSArray *partitions;
@property (nonatomic, strong) NSArray *entranceIcons;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
