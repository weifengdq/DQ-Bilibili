//
//  HRHead.h
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HRHead : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *param;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *gotoProperty;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
