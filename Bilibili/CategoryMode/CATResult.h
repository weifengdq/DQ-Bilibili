//
//  CATResult.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CATChild;

@interface CATResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) CATChild *child;
@property (nonatomic, strong) NSArray *covers;
@property (nonatomic, strong) NSArray *root;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
