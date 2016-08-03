//
//  HRBody.h
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HRBody : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) NSString *up;
@property (nonatomic, strong) NSString *param;
@property (nonatomic, strong) NSString *desc1;
@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *gotoProperty;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *upFace;
@property (nonatomic, strong) NSString *danmaku;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, assign) double height;
@property (nonatomic, assign) double online;
@property (nonatomic, strong) NSString *play;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
