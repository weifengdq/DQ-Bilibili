//
//  SSData.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SSPage;

@interface SSData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *feeds;
@property (nonatomic, strong) SSPage *page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
