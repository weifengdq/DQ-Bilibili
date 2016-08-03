//
//  CAT119.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CAT119 : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double tid;
@property (nonatomic, strong) NSString *typename;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
