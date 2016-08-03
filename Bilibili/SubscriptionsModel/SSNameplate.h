//
//  SSNameplate.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SSNameplate : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *condition;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, assign) double nid;
@property (nonatomic, strong) NSString *imageSmall;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
