//
//  LSOwner.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSOwner.h"


NSString *const kLSOwnerFace = @"face";
NSString *const kLSOwnerMid = @"mid";
NSString *const kLSOwnerName = @"name";


@interface LSOwner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSOwner

@synthesize face = _face;
@synthesize mid = _mid;
@synthesize name = _name;


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
            self.face = [self objectOrNilForKey:kLSOwnerFace fromDictionary:dict];
            self.mid = [[self objectOrNilForKey:kLSOwnerMid fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kLSOwnerName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.face forKey:kLSOwnerFace];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kLSOwnerMid];
    [mutableDict setValue:self.name forKey:kLSOwnerName];

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

    self.face = [aDecoder decodeObjectForKey:kLSOwnerFace];
    self.mid = [aDecoder decodeDoubleForKey:kLSOwnerMid];
    self.name = [aDecoder decodeObjectForKey:kLSOwnerName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_face forKey:kLSOwnerFace];
    [aCoder encodeDouble:_mid forKey:kLSOwnerMid];
    [aCoder encodeObject:_name forKey:kLSOwnerName];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSOwner *copy = [[LSOwner alloc] init];
    
    if (copy) {

        copy.face = [self.face copyWithZone:zone];
        copy.mid = self.mid;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
