//
//  LSBanner.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSBanner.h"


NSString *const kLSBannerRemark = @"remark";
NSString *const kLSBannerTitle = @"title";
NSString *const kLSBannerImg = @"img";
NSString *const kLSBannerLink = @"link";


@interface LSBanner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSBanner

@synthesize remark = _remark;
@synthesize title = _title;
@synthesize img = _img;
@synthesize link = _link;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.remark = [self objectOrNilForKey:kLSBannerRemark fromDictionary:dict];
            self.title = [self objectOrNilForKey:kLSBannerTitle fromDictionary:dict];
            self.img = [self objectOrNilForKey:kLSBannerImg fromDictionary:dict];
            self.link = [self objectOrNilForKey:kLSBannerLink fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.remark forKey:kLSBannerRemark];
    [mutableDict setValue:self.title forKey:kLSBannerTitle];
    [mutableDict setValue:self.img forKey:kLSBannerImg];
    [mutableDict setValue:self.link forKey:kLSBannerLink];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.remark = [aDecoder decodeObjectForKey:kLSBannerRemark];
    self.title = [aDecoder decodeObjectForKey:kLSBannerTitle];
    self.img = [aDecoder decodeObjectForKey:kLSBannerImg];
    self.link = [aDecoder decodeObjectForKey:kLSBannerLink];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_remark forKey:kLSBannerRemark];
    [aCoder encodeObject:_title forKey:kLSBannerTitle];
    [aCoder encodeObject:_img forKey:kLSBannerImg];
    [aCoder encodeObject:_link forKey:kLSBannerLink];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSBanner *copy = [[LSBanner alloc] init];
    
    if (copy) {

        copy.remark = [self.remark copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
    }
    
    return copy;
}


@end
