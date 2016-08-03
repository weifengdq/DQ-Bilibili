//
//  SSFeeds.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SSAddition, SSSource;

@interface SSFeeds : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double addId;
@property (nonatomic, strong) SSAddition *addition;
@property (nonatomic, assign) double mcid;
@property (nonatomic, assign) double feedsIdentifier;
@property (nonatomic, assign) double ctime;
@property (nonatomic, strong) SSSource *source;
@property (nonatomic, assign) double srcId;
@property (nonatomic, assign) double type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
