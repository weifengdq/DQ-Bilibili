//
//  SSSource.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SSPendant, SSNameplate, SSLevelInfo;

@interface SSSource : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) SSPendant *pendant;
@property (nonatomic, strong) NSString *uname;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *displayRank;
@property (nonatomic, strong) SSNameplate *nameplate;
@property (nonatomic, strong) SSLevelInfo *levelInfo;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *rank;
@property (nonatomic, strong) NSString *sign;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
