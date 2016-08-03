//
//  SSSource.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSSource.h"
#import "SSPendant.h"
#import "SSNameplate.h"
#import "SSLevelInfo.h"


NSString *const kSSSourceAvatar = @"avatar";
NSString *const kSSSourcePendant = @"pendant";
NSString *const kSSSourceUname = @"uname";
NSString *const kSSSourceMid = @"mid";
NSString *const kSSSourceDisplayRank = @"DisplayRank";
NSString *const kSSSourceNameplate = @"nameplate";
NSString *const kSSSourceLevelInfo = @"level_info";
NSString *const kSSSourceSex = @"sex";
NSString *const kSSSourceRank = @"rank";
NSString *const kSSSourceSign = @"sign";


@interface SSSource ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSSource

@synthesize avatar = _avatar;
@synthesize pendant = _pendant;
@synthesize uname = _uname;
@synthesize mid = _mid;
@synthesize displayRank = _displayRank;
@synthesize nameplate = _nameplate;
@synthesize levelInfo = _levelInfo;
@synthesize sex = _sex;
@synthesize rank = _rank;
@synthesize sign = _sign;


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
            self.avatar = [self objectOrNilForKey:kSSSourceAvatar fromDictionary:dict];
            self.pendant = [SSPendant modelObjectWithDictionary:[dict objectForKey:kSSSourcePendant]];
            self.uname = [self objectOrNilForKey:kSSSourceUname fromDictionary:dict];
            self.mid = [self objectOrNilForKey:kSSSourceMid fromDictionary:dict];
            self.displayRank = [self objectOrNilForKey:kSSSourceDisplayRank fromDictionary:dict];
            self.nameplate = [SSNameplate modelObjectWithDictionary:[dict objectForKey:kSSSourceNameplate]];
            self.levelInfo = [SSLevelInfo modelObjectWithDictionary:[dict objectForKey:kSSSourceLevelInfo]];
            self.sex = [self objectOrNilForKey:kSSSourceSex fromDictionary:dict];
            self.rank = [self objectOrNilForKey:kSSSourceRank fromDictionary:dict];
            self.sign = [self objectOrNilForKey:kSSSourceSign fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.avatar forKey:kSSSourceAvatar];
    [mutableDict setValue:[self.pendant dictionaryRepresentation] forKey:kSSSourcePendant];
    [mutableDict setValue:self.uname forKey:kSSSourceUname];
    [mutableDict setValue:self.mid forKey:kSSSourceMid];
    [mutableDict setValue:self.displayRank forKey:kSSSourceDisplayRank];
    [mutableDict setValue:[self.nameplate dictionaryRepresentation] forKey:kSSSourceNameplate];
    [mutableDict setValue:[self.levelInfo dictionaryRepresentation] forKey:kSSSourceLevelInfo];
    [mutableDict setValue:self.sex forKey:kSSSourceSex];
    [mutableDict setValue:self.rank forKey:kSSSourceRank];
    [mutableDict setValue:self.sign forKey:kSSSourceSign];

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

    self.avatar = [aDecoder decodeObjectForKey:kSSSourceAvatar];
    self.pendant = [aDecoder decodeObjectForKey:kSSSourcePendant];
    self.uname = [aDecoder decodeObjectForKey:kSSSourceUname];
    self.mid = [aDecoder decodeObjectForKey:kSSSourceMid];
    self.displayRank = [aDecoder decodeObjectForKey:kSSSourceDisplayRank];
    self.nameplate = [aDecoder decodeObjectForKey:kSSSourceNameplate];
    self.levelInfo = [aDecoder decodeObjectForKey:kSSSourceLevelInfo];
    self.sex = [aDecoder decodeObjectForKey:kSSSourceSex];
    self.rank = [aDecoder decodeObjectForKey:kSSSourceRank];
    self.sign = [aDecoder decodeObjectForKey:kSSSourceSign];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_avatar forKey:kSSSourceAvatar];
    [aCoder encodeObject:_pendant forKey:kSSSourcePendant];
    [aCoder encodeObject:_uname forKey:kSSSourceUname];
    [aCoder encodeObject:_mid forKey:kSSSourceMid];
    [aCoder encodeObject:_displayRank forKey:kSSSourceDisplayRank];
    [aCoder encodeObject:_nameplate forKey:kSSSourceNameplate];
    [aCoder encodeObject:_levelInfo forKey:kSSSourceLevelInfo];
    [aCoder encodeObject:_sex forKey:kSSSourceSex];
    [aCoder encodeObject:_rank forKey:kSSSourceRank];
    [aCoder encodeObject:_sign forKey:kSSSourceSign];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSSource *copy = [[SSSource alloc] init];
    
    if (copy) {

        copy.avatar = [self.avatar copyWithZone:zone];
        copy.pendant = [self.pendant copyWithZone:zone];
        copy.uname = [self.uname copyWithZone:zone];
        copy.mid = [self.mid copyWithZone:zone];
        copy.displayRank = [self.displayRank copyWithZone:zone];
        copy.nameplate = [self.nameplate copyWithZone:zone];
        copy.levelInfo = [self.levelInfo copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.rank = [self.rank copyWithZone:zone];
        copy.sign = [self.sign copyWithZone:zone];
    }
    
    return copy;
}


@end
