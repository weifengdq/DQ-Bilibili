//
//  BSResult.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BSLatestUpdate;

@interface BSResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *banners;
@property (nonatomic, strong) NSArray *ends;
@property (nonatomic, strong) BSLatestUpdate *latestUpdate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
