//
//  BSList.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BSList.h"


NSString *const kBSListWatchingCount = @"watchingCount";
NSString *const kBSListNewestEpId = @"newest_ep_id";
NSString *const kBSListSeasonId = @"season_id";
NSString *const kBSListTitle = @"title";
NSString *const kBSListNewestEpIndex = @"newest_ep_index";
NSString *const kBSListCover = @"cover";
NSString *const kBSListLastTime = @"last_time";
NSString *const kBSListTotalCount = @"total_count";


@interface BSList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BSList

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
            self.watchingCount = [self objectOrNilForKey:kBSListWatchingCount fromDictionary:dict];
            self.newestEpId = [self objectOrNilForKey:kBSListNewestEpId fromDictionary:dict];
            self.seasonId = [self objectOrNilForKey:kBSListSeasonId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kBSListTitle fromDictionary:dict];
            self.newestEpIndex = [self objectOrNilForKey:kBSListNewestEpIndex fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kBSListCover fromDictionary:dict];
            self.lastTime = [self objectOrNilForKey:kBSListLastTime fromDictionary:dict];
            self.totalCount = [self objectOrNilForKey:kBSListTotalCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.watchingCount forKey:kBSListWatchingCount];
    [mutableDict setValue:self.newestEpId forKey:kBSListNewestEpId];
    [mutableDict setValue:self.seasonId forKey:kBSListSeasonId];
    [mutableDict setValue:self.title forKey:kBSListTitle];
    [mutableDict setValue:self.newestEpIndex forKey:kBSListNewestEpIndex];
    [mutableDict setValue:self.cover forKey:kBSListCover];
    [mutableDict setValue:self.lastTime forKey:kBSListLastTime];
    [mutableDict setValue:self.totalCount forKey:kBSListTotalCount];

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

    self.watchingCount = [aDecoder decodeObjectForKey:kBSListWatchingCount];
    self.newestEpId = [aDecoder decodeObjectForKey:kBSListNewestEpId];
    self.seasonId = [aDecoder decodeObjectForKey:kBSListSeasonId];
    self.title = [aDecoder decodeObjectForKey:kBSListTitle];
    self.newestEpIndex = [aDecoder decodeObjectForKey:kBSListNewestEpIndex];
    self.cover = [aDecoder decodeObjectForKey:kBSListCover];
    self.lastTime = [aDecoder decodeObjectForKey:kBSListLastTime];
    self.totalCount = [aDecoder decodeObjectForKey:kBSListTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_watchingCount forKey:kBSListWatchingCount];
    [aCoder encodeObject:_newestEpId forKey:kBSListNewestEpId];
    [aCoder encodeObject:_seasonId forKey:kBSListSeasonId];
    [aCoder encodeObject:_title forKey:kBSListTitle];
    [aCoder encodeObject:_newestEpIndex forKey:kBSListNewestEpIndex];
    [aCoder encodeObject:_cover forKey:kBSListCover];
    [aCoder encodeObject:_lastTime forKey:kBSListLastTime];
    [aCoder encodeObject:_totalCount forKey:kBSListTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    BSList *copy = [[BSList alloc] init];
    
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
