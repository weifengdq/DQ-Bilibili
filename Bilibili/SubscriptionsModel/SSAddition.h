//
//  SSAddition.h
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SSAddition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double videoReview;
@property (nonatomic, assign) double review;
@property (nonatomic, strong) NSString *viewAt;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double money;
@property (nonatomic, assign) double favorites;
@property (nonatomic, assign) double mid;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *typename;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSString *create;
@property (nonatomic, assign) double aid;
@property (nonatomic, strong) NSString *favCreateAt;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, assign) double play;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, assign) double favCreate;
@property (nonatomic, assign) double coins;
@property (nonatomic, assign) double credit;
@property (nonatomic, assign) double view;
@property (nonatomic, assign) double typeid;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *additionDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
