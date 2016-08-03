//
//  CATRoot.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CATRoot : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double tid;
@property (nonatomic, strong) NSString *searchname;
@property (nonatomic, strong) NSString *captionname;
@property (nonatomic, strong) NSString *typename;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
