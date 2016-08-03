//
//  BSEnds.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BSEnds.h"


NSString *const kBSEndsWatchingCount = @"watchingCount";
NSString *const kBSEndsNewestEpId = @"newest_ep_id";
NSString *const kBSEndsSeasonId = @"season_id";
NSString *const kBSEndsTitle = @"title";
NSString *const kBSEndsNewestEpIndex = @"newest_ep_index";
NSString *const kBSEndsCover = @"cover";
NSString *const kBSEndsLastTime = @"last_time";
NSString *const kBSEndsTotalCount = @"total_count";


@interface BSEnds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BSEnds

@synthesize watchingCount = _watchingCount;
@synthesize newestEpId = _newestEpId;
@synthesize seasonId = _seasonId;
@synthesize title = _title;
@synthesize newestEpIndex = _newestEpIndex;
@synthesize cover = _cover;
@synthesize lastTime = _lastTime;
@synthesize totalCount = _totalCount;


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
            self.watchingCount = [self objectOrNilForKey:kBSEndsWatchingCount fromDictionary:dict];
            self.newestEpId = [self objectOrNilForKey:kBSEndsNewestEpId fromDictionary:dict];
            self.seasonId = [self objectOrNilForKey:kBSEndsSeasonId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kBSEndsTitle fromDictionary:dict];
            self.newestEpIndex = [self objectOrNilForKey:kBSEndsNewestEpIndex fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kBSEndsCover fromDictionary:dict];
            self.lastTime = [self objectOrNilForKey:kBSEndsLastTime fromDictionary:dict];
            self.totalCount = [self objectOrNilForKey:kBSEndsTotalCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.watchingCount forKey:kBSEndsWatchingCount];
    [mutableDict setValue:self.newestEpId forKey:kBSEndsNewestEpId];
    [mutableDict setValue:self.seasonId forKey:kBSEndsSeasonId];
    [mutableDict setValue:self.title forKey:kBSEndsTitle];
    [mutableDict setValue:self.newestEpIndex forKey:kBSEndsNewestEpIndex];
    [mutableDict setValue:self.cover forKey:kBSEndsCover];
    [mutableDict setValue:self.lastTime forKey:kBSEndsLastTime];
    [mutableDict setValue:self.totalCount forKey:kBSEndsTotalCount];

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

    self.watchingCount = [aDecoder decodeObjectForKey:kBSEndsWatchingCount];
    self.newestEpId = [aDecoder decodeObjectForKey:kBSEndsNewestEpId];
    self.seasonId = [aDecoder decodeObjectForKey:kBSEndsSeasonId];
    self.title = [aDecoder decodeObjectForKey:kBSEndsTitle];
    self.newestEpIndex = [aDecoder decodeObjectForKey:kBSEndsNewestEpIndex];
    self.cover = [aDecoder decodeObjectForKey:kBSEndsCover];
    self.lastTime = [aDecoder decodeObjectForKey:kBSEndsLastTime];
    self.totalCount = [aDecoder decodeObjectForKey:kBSEndsTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_watchingCount forKey:kBSEndsWatchingCount];
    [aCoder encodeObject:_newestEpId forKey:kBSEndsNewestEpId];
    [aCoder encodeObject:_seasonId forKey:kBSEndsSeasonId];
    [aCoder encodeObject:_title forKey:kBSEndsTitle];
    [aCoder encodeObject:_newestEpIndex forKey:kBSEndsNewestEpIndex];
    [aCoder encodeObject:_cover forKey:kBSEndsCover];
    [aCoder encodeObject:_lastTime forKey:kBSEndsLastTime];
    [aCoder encodeObject:_totalCount forKey:kBSEndsTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    BSEnds *copy = [[BSEnds alloc] init];
    
    if (copy) {

        copy.watchingCount = [self.watchingCount copyWithZone:zone];
        copy.newestEpId = [self.newestEpId copyWithZone:zone];
        copy.seasonId = [self.seasonId copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.newestEpIndex = [self.newestEpIndex copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
        copy.lastTime = [self.lastTime copyWithZone:zone];
        copy.totalCount = [self.totalCount copyWithZone:zone];
    }
    
    return copy;
}


@end
