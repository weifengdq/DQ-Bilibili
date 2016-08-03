//
//  LSLives.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSOwner, LSCover;

@interface LSLives : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) LSOwner *owner;
@property (nonatomic, assign) double online;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, assign) double areaId;
@property (nonatomic, strong) NSString *acceptQuality;
@property (nonatomic, assign) double roomId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double broadcastType;
@property (nonatomic, strong) LSCover *cover;
@property (nonatomic, strong) NSString *playurl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
