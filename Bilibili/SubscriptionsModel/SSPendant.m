//
//  SSPendant.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSPendant.h"


NSString *const kSSPendantExpire = @"expire";
NSString *const kSSPendantName = @"name";
NSString *const kSSPendantPid = @"pid";
NSString *const kSSPendantImage = @"image";


@interface SSPendant ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSPendant

@synthesize expire = _expire;
@synthesize name = _name;
@synthesize pid = _pid;
@synthesize image = _image;


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
            self.expire = [[self objectOrNilForKey:kSSPendantExpire fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kSSPendantName fromDictionary:dict];
            self.pid = [[self objectOrNilForKey:kSSPendantPid fromDictionary:dict] doubleValue];
            self.image = [self objectOrNilForKey:kSSPendantImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expire] forKey:kSSPendantExpire];
    [mutableDict setValue:self.name forKey:kSSPendantName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pid] forKey:kSSPendantPid];
    [mutableDict setValue:self.image forKey:kSSPendantImage];

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

    self.expire = [aDecoder decodeDoubleForKey:kSSPendantExpire];
    self.name = [aDecoder decodeObjectForKey:kSSPendantName];
    self.pid = [aDecoder decodeDoubleForKey:kSSPendantPid];
    self.image = [aDecoder decodeObjectForKey:kSSPendantImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_expire forKey:kSSPendantExpire];
    [aCoder encodeObject:_name forKey:kSSPendantName];
    [aCoder encodeDouble:_pid forKey:kSSPendantPid];
    [aCoder encodeObject:_image forKey:kSSPendantImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSPendant *copy = [[SSPendant alloc] init];
    
    if (copy) {

        copy.expire = self.expire;
        copy.name = [self.name copyWithZone:zone];
        copy.pid = self.pid;
        copy.image = [self.image copyWithZone:zone];
    }
    
    return copy;
}


@end
