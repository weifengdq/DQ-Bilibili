//
//  SSLevelInfo.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SSLevelInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double currentLevel;
@property (nonatomic, assign) double currentMin;
@property (nonatomic, assign) double currentExp;
@property (nonatomic, strong) NSString *nextExp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
