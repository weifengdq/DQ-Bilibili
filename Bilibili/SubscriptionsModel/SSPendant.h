//
//  SSPendant.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SSPendant : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double expire;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double pid;
@property (nonatomic, strong) NSString *image;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
