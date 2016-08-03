//
//  BSLatestUpdate.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BSLatestUpdate : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSString *updateCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
