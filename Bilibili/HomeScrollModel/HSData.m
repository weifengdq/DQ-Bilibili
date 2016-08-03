//
//  HSData.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HSData.h"


NSString *const kHSDataWeight = @"weight";
NSString *const kHSDataHash = @"hash";
NSString *const kHSDataRemark = @"remark";
NSString *const kHSDataTitle = @"title";
NSString *const kHSDataImage = @"image";
NSString *const kHSDataValue = @"value";
NSString *const kHSDataType = @"type";


@interface HSData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HSData

@synthesize weight = _weight;
@synthesize hash = _hash;
@synthesize remark = _remark;
@synthesize title = _title;
@synthesize image = _image;
@synthesize value = _value;
@synthesize type = _type;


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
            self.weight = [[self objectOrNilForKey:kHSDataWeight fromDictionary:dict] doubleValue];
            self.hash = [self objectOrNilForKey:kHSDataHash fromDictionary:dict];
            self.remark = [self objectOrNilForKey:kHSDataRemark fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHSDataTitle fromDictionary:dict];
            self.image = [self objectOrNilForKey:kHSDataImage fromDictionary:dict];
            self.value = [self objectOrNilForKey:kHSDataValue fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kHSDataType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kHSDataWeight];
    [mutableDict setValue:self.hash forKey:kHSDataHash];
    [mutableDict setValue:self.remark forKey:kHSDataRemark];
    [mutableDict setValue:self.title forKey:kHSDataTitle];
    [mutableDict setValue:self.image forKey:kHSDataImage];
    [mutableDict setValue:self.value forKey:kHSDataValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kHSDataType];

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

    self.weight = [aDecoder decodeDoubleForKey:kHSDataWeight];
    self.hash = [aDecoder decodeObjectForKey:kHSDataHash];
    self.remark = [aDecoder decodeObjectForKey:kHSDataRemark];
    self.title = [aDecoder decodeObjectForKey:kHSDataTitle];
    self.image = [aDecoder decodeObjectForKey:kHSDataImage];
    self.value = [aDecoder decodeObjectForKey:kHSDataValue];
    self.type = [aDecoder decodeDoubleForKey:kHSDataType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_weight forKey:kHSDataWeight];
    [aCoder encodeObject:_hash forKey:kHSDataHash];
    [aCoder encodeObject:_remark forKey:kHSDataRemark];
    [aCoder encodeObject:_title forKey:kHSDataTitle];
    [aCoder encodeObject:_image forKey:kHSDataImage];
    [aCoder encodeObject:_value forKey:kHSDataValue];
    [aCoder encodeDouble:_type forKey:kHSDataType];
}

- (id)copyWithZone:(NSZone *)zone
{
    HSData *copy = [[HSData alloc] init];
    
    if (copy) {

        copy.weight = self.weight;
        copy.hash = [self.hash copyWithZone:zone];
        copy.remark = [self.remark copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.value = [self.value copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
