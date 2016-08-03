//
//  SSPage.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SSPage : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double count;
@property (nonatomic, assign) double num;
@property (nonatomic, assign) double size;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
