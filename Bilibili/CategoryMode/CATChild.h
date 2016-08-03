//
//  CATChild.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CATChild : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *c36;
@property (nonatomic, strong) NSArray *c3;
@property (nonatomic, strong) NSArray *c11;
@property (nonatomic, strong) NSArray *c160;
@property (nonatomic, strong) NSArray *c4;
@property (nonatomic, strong) NSArray *c5;
@property (nonatomic, strong) NSArray *c129;
@property (nonatomic, strong) NSArray *c23;
@property (nonatomic, strong) NSArray *c155;
@property (nonatomic, strong) NSArray *c13;
@property (nonatomic, strong) NSArray *c1;
@property (nonatomic, strong) NSArray *c119;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
