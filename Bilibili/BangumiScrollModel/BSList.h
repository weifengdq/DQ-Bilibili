//
//  BSList.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BSList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *watchingCount;
@property (nonatomic, strong) NSString *newestEpId;
@property (nonatomic, strong) NSString *seasonId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *newestEpIndex;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *lastTime;
@property (nonatomic, strong) NSString *totalCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
