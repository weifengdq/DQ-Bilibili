//
//  SSNameplate.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSNameplate.h"


NSString *const kSSNameplateName = @"name";
NSString *const kSSNameplateCondition = @"condition";
NSString *const kSSNameplateLevel = @"level";
NSString *const kSSNameplateImage = @"image";
NSString *const kSSNameplateNid = @"nid";
NSString *const kSSNameplateImageSmall = @"image_small";


@interface SSNameplate ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSNameplate

@synthesize name = _name;
@synthesize condition = _condition;
@synthesize level = _level;
@synthesize image = _image;
@synthesize nid = _nid;
@synthesize imageSmall = _imageSmall;


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
            self.name = [self objectOrNilForKey:kSSNameplateName fromDictionary:dict];
            self.condition = [self objectOrNilForKey:kSSNameplateCondition fromDictionary:dict];
            self.level = [self objectOrNilForKey:kSSNameplateLevel fromDictionary:dict];
            self.image = [self objectOrNilForKey:kSSNameplateImage fromDictionary:dict];
            self.nid = [[self objectOrNilForKey:kSSNameplateNid fromDictionary:dict] doubleValue];
            self.imageSmall = [self objectOrNilForKey:kSSNameplateImageSmall fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kSSNameplateName];
    [mutableDict setValue:self.condition forKey:kSSNameplateCondition];
    [mutableDict setValue:self.level forKey:kSSNameplateLevel];
    [mutableDict setValue:self.image forKey:kSSNameplateImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nid] forKey:kSSNameplateNid];
    [mutableDict setValue:self.imageSmall forKey:kSSNameplateImageSmall];

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

    self.name = [aDecoder decodeObjectForKey:kSSNameplateName];
    self.condition = [aDecoder decodeObjectForKey:kSSNameplateCondition];
    self.level = [aDecoder decodeObjectForKey:kSSNameplateLevel];
    self.image = [aDecoder decodeObjectForKey:kSSNameplateImage];
    self.nid = [aDecoder decodeDoubleForKey:kSSNameplateNid];
    self.imageSmall = [aDecoder decodeObjectForKey:kSSNameplateImageSmall];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kSSNameplateName];
    [aCoder encodeObject:_condition forKey:kSSNameplateCondition];
    [aCoder encodeObject:_level forKey:kSSNameplateLevel];
    [aCoder encodeObject:_image forKey:kSSNameplateImage];
    [aCoder encodeDouble:_nid forKey:kSSNameplateNid];
    [aCoder encodeObject:_imageSmall forKey:kSSNameplateImageSmall];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSNameplate *copy = [[SSNameplate alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.condition = [self.condition copyWithZone:zone];
        copy.level = [self.level copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.nid = self.nid;
        copy.imageSmall = [self.imageSmall copyWithZone:zone];
    }
    
    return copy;
}


@end
