//
//  LSLives.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSLives.h"
#import "LSOwner.h"
#import "LSCover.h"


NSString *const kLSLivesOwner = @"owner";
NSString *const kLSLivesOnline = @"online";
NSString *const kLSLivesArea = @"area";
NSString *const kLSLivesAreaId = @"area_id";
NSString *const kLSLivesAcceptQuality = @"accept_quality";
NSString *const kLSLivesRoomId = @"room_id";
NSString *const kLSLivesTitle = @"title";
NSString *const kLSLivesBroadcastType = @"broadcast_type";
NSString *const kLSLivesCover = @"cover";
NSString *const kLSLivesPlayurl = @"playurl";


@interface LSLives ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSLives

@synthesize owner = _owner;
@synthesize online = _online;
@synthesize area = _area;
@synthesize areaId = _areaId;
@synthesize acceptQuality = _acceptQuality;
@synthesize roomId = _roomId;
@synthesize title = _title;
@synthesize broadcastType = _broadcastType;
@synthesize cover = _cover;
@synthesize playurl = _playurl;


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
            self.owner = [LSOwner modelObjectWithDictionary:[dict objectForKey:kLSLivesOwner]];
            self.online = [[self objectOrNilForKey:kLSLivesOnline fromDictionary:dict] doubleValue];
            self.area = [self objectOrNilForKey:kLSLivesArea fromDictionary:dict];
            self.areaId = [[self objectOrNilForKey:kLSLivesAreaId fromDictionary:dict] doubleValue];
            self.acceptQuality = [self objectOrNilForKey:kLSLivesAcceptQuality fromDictionary:dict];
            self.roomId = [[self objectOrNilForKey:kLSLivesRoomId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kLSLivesTitle fromDictionary:dict];
            self.broadcastType = [[self objectOrNilForKey:kLSLivesBroadcastType fromDictionary:dict] doubleValue];
            self.cover = [LSCover modelObjectWithDictionary:[dict objectForKey:kLSLivesCover]];
            self.playurl = [self objectOrNilForKey:kLSLivesPlayurl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:kLSLivesOwner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kLSLivesOnline];
    [mutableDict setValue:self.area forKey:kLSLivesArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.areaId] forKey:kLSLivesAreaId];
    [mutableDict setValue:self.acceptQuality forKey:kLSLivesAcceptQuality];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kLSLivesRoomId];
    [mutableDict setValue:self.title forKey:kLSLivesTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.broadcastType] forKey:kLSLivesBroadcastType];
    [mutableDict setValue:[self.cover dictionaryRepresentation] forKey:kLSLivesCover];
    [mutableDict setValue:self.playurl forKey:kLSLivesPlayurl];

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

    self.owner = [aDecoder decodeObjectForKey:kLSLivesOwner];
    self.online = [aDecoder decodeDoubleForKey:kLSLivesOnline];
    self.area = [aDecoder decodeObjectForKey:kLSLivesArea];
    self.areaId = [aDecoder decodeDoubleForKey:kLSLivesAreaId];
    self.acceptQuality = [aDecoder decodeObjectForKey:kLSLivesAcceptQuality];
    self.roomId = [aDecoder decodeDoubleForKey:kLSLivesRoomId];
    self.title = [aDecoder decodeObjectForKey:kLSLivesTitle];
    self.broadcastType = [aDecoder decodeDoubleForKey:kLSLivesBroadcastType];
    self.cover = [aDecoder decodeObjectForKey:kLSLivesCover];
    self.playurl = [aDecoder decodeObjectForKey:kLSLivesPlayurl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_owner forKey:kLSLivesOwner];
    [aCoder encodeDouble:_online forKey:kLSLivesOnline];
    [aCoder encodeObject:_area forKey:kLSLivesArea];
    [aCoder encodeDouble:_areaId forKey:kLSLivesAreaId];
    [aCoder encodeObject:_acceptQuality forKey:kLSLivesAcceptQuality];
    [aCoder encodeDouble:_roomId forKey:kLSLivesRoomId];
    [aCoder encodeObject:_title forKey:kLSLivesTitle];
    [aCoder encodeDouble:_broadcastType forKey:kLSLivesBroadcastType];
    [aCoder encodeObject:_cover forKey:kLSLivesCover];
    [aCoder encodeObject:_playurl forKey:kLSLivesPlayurl];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSLives *copy = [[LSLives alloc] init];
    
    if (copy) {

        copy.owner = [self.owner copyWithZone:zone];
        copy.online = self.online;
        copy.area = [self.area copyWithZone:zone];
        copy.areaId = self.areaId;
        copy.acceptQuality = [self.acceptQuality copyWithZone:zone];
        copy.roomId = self.roomId;
        copy.title = [self.title copyWithZone:zone];
        copy.broadcastType = self.broadcastType;
        copy.cover = [self.cover copyWithZone:zone];
        copy.playurl = [self.playurl copyWithZone:zone];
    }
    
    return copy;
}


@end
