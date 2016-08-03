//
//  BSBanners.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BSBanners.h"


NSString *const kBSBannersImg = @"img";
NSString *const kBSBannersLink = @"link";
NSString *const kBSBannersTitle = @"title";


@interface BSBanners ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BSBanners

@synthesize img = _img;
@synthesize link = _link;
@synthesize title = _title;


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
            self.img = [self objectOrNilForKey:kBSBannersImg fromDictionary:dict];
            self.link = [self objectOrNilForKey:kBSBannersLink fromDictionary:dict];
            self.title = [self objectOrNilForKey:kBSBannersTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.img forKey:kBSBannersImg];
    [mutableDict setValue:self.link forKey:kBSBannersLink];
    [mutableDict setValue:self.title forKey:kBSBannersTitle];

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

    self.img = [aDecoder decodeObjectForKey:kBSBannersImg];
    self.link = [aDecoder decodeObjectForKey:kBSBannersLink];
    self.title = [aDecoder decodeObjectForKey:kBSBannersTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_img forKey:kBSBannersImg];
    [aCoder encodeObject:_link forKey:kBSBannersLink];
    [aCoder encodeObject:_title forKey:kBSBannersTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    BSBanners *copy = [[BSBanners alloc] init];
    
    if (copy) {

        copy.img = [self.img copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


@end
