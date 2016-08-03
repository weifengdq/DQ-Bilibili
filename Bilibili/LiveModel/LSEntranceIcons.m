//
//  LSEntranceIcons.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSEntranceIcons.h"
#import "LSEntranceIcon.h"


NSString *const kLSEntranceIconsId = @"id";
NSString *const kLSEntranceIconsName = @"name";
NSString *const kLSEntranceIconsEntranceIcon = @"entrance_icon";


@interface LSEntranceIcons ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSEntranceIcons

@synthesize entranceIconsIdentifier = _entranceIconsIdentifier;
@synthesize name = _name;
@synthesize entranceIcon = _entranceIcon;


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
            self.entranceIconsIdentifier = [[self objectOrNilForKey:kLSEntranceIconsId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kLSEntranceIconsName fromDictionary:dict];
            self.entranceIcon = [LSEntranceIcon modelObjectWithDictionary:[dict objectForKey:kLSEntranceIconsEntranceIcon]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.entranceIconsIdentifier] forKey:kLSEntranceIconsId];
    [mutableDict setValue:self.name forKey:kLSEntranceIconsName];
    [mutableDict setValue:[self.entranceIcon dictionaryRepresentation] forKey:kLSEntranceIconsEntranceIcon];

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

    self.entranceIconsIdentifier = [aDecoder decodeDoubleForKey:kLSEntranceIconsId];
    self.name = [aDecoder decodeObjectForKey:kLSEntranceIconsName];
    self.entranceIcon = [aDecoder decodeObjectForKey:kLSEntranceIconsEntranceIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_entranceIconsIdentifier forKey:kLSEntranceIconsId];
    [aCoder encodeObject:_name forKey:kLSEntranceIconsName];
    [aCoder encodeObject:_entranceIcon forKey:kLSEntranceIconsEntranceIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSEntranceIcons *copy = [[LSEntranceIcons alloc] init];
    
    if (copy) {

        copy.entranceIconsIdentifier = self.entranceIconsIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.entranceIcon = [self.entranceIcon copyWithZone:zone];
    }
    
    return copy;
}


@end
