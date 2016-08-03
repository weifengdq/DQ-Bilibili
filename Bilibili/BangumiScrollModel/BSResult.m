//
//  BSResult.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BSResult.h"
#import "BSBanners.h"
#import "BSEnds.h"
#import "BSLatestUpdate.h"


NSString *const kBSResultBanners = @"banners";
NSString *const kBSResultEnds = @"ends";
NSString *const kBSResultLatestUpdate = @"latestUpdate";


@interface BSResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BSResult

@synthesize banners = _banners;
@synthesize ends = _ends;
@synthesize latestUpdate = _latestUpdate;


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
    NSObject *receivedBSBanners = [dict objectForKey:kBSResultBanners];
    NSMutableArray *parsedBSBanners = [NSMutableArray array];
    if ([receivedBSBanners isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBSBanners) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBSBanners addObject:[BSBanners modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBSBanners isKindOfClass:[NSDictionary class]]) {
       [parsedBSBanners addObject:[BSBanners modelObjectWithDictionary:(NSDictionary *)receivedBSBanners]];
    }

    self.banners = [NSArray arrayWithArray:parsedBSBanners];
    NSObject *receivedBSEnds = [dict objectForKey:kBSResultEnds];
    NSMutableArray *parsedBSEnds = [NSMutableArray array];
    if ([receivedBSEnds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBSEnds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBSEnds addObject:[BSEnds modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBSEnds isKindOfClass:[NSDictionary class]]) {
       [parsedBSEnds addObject:[BSEnds modelObjectWithDictionary:(NSDictionary *)receivedBSEnds]];
    }

    self.ends = [NSArray arrayWithArray:parsedBSEnds];
            self.latestUpdate = [BSLatestUpdate modelObjectWithDictionary:[dict objectForKey:kBSResultLatestUpdate]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForBanners = [NSMutableArray array];
    for (NSObject *subArrayObject in self.banners) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBanners addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBanners addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBanners] forKey:kBSResultBanners];
    NSMutableArray *tempArrayForEnds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ends) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEnds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEnds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEnds] forKey:kBSResultEnds];
    [mutableDict setValue:[self.latestUpdate dictionaryRepresentation] forKey:kBSResultLatestUpdate];

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

    self.banners = [aDecoder decodeObjectForKey:kBSResultBanners];
    self.ends = [aDecoder decodeObjectForKey:kBSResultEnds];
    self.latestUpdate = [aDecoder decodeObjectForKey:kBSResultLatestUpdate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_banners forKey:kBSResultBanners];
    [aCoder encodeObject:_ends forKey:kBSResultEnds];
    [aCoder encodeObject:_latestUpdate forKey:kBSResultLatestUpdate];
}

- (id)copyWithZone:(NSZone *)zone
{
    BSResult *copy = [[BSResult alloc] init];
    
    if (copy) {

        copy.banners = [self.banners copyWithZone:zone];
        copy.ends = [self.ends copyWithZone:zone];
        copy.latestUpdate = [self.latestUpdate copyWithZone:zone];
    }
    
    return copy;
}


@end
