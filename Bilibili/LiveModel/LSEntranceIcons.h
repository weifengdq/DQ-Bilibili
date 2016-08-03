//
//  LSEntranceIcons.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSEntranceIcon;

@interface LSEntranceIcons : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double entranceIconsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) LSEntranceIcon *entranceIcon;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
