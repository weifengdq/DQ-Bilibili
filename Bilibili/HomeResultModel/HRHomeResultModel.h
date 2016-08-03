//
//  HRHomeResultModel.h
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HRHomeResultModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *result;
@property (nonatomic, assign) double code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
