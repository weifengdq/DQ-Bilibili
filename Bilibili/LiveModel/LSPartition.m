//
//  LSPartition.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSPartition.h"
#import "LSSubIcon.h"


NSString *const kLSPartitionId = @"id";
NSString *const kLSPartitionSubIcon = @"sub_icon";
NSString *const kLSPartitionArea = @"area";
NSString *const kLSPartitionName = @"name";
NSString *const kLSPartitionCount = @"count";


@interface LSPartition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSPartition

@synthesize partitionIdentifier = _partitionIdentifier;
@synthesize subIcon = _subIcon;
@synthesize area = _area;
@synthesize name = _name;
@synthesize count = _count;


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
            self.partitionIdentifier = [[self objectOrNilForKey:kLSPartitionId fromDictionary:dict] doubleValue];
            self.subIcon = [LSSubIcon modelObjectWithDictionary:[dict objectForKey:kLSPartitionSubIcon]];
            self.area = [self objectOrNilForKey:kLSPartitionArea fromDictionary:dict];
            self.name = [self objectOrNilForKey:kLSPartitionName fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kLSPartitionCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.partitionIdentifier] forKey:kLSPartitionId];
    [mutableDict setValue:[self.subIcon dictionaryRepresentation] forKey:kLSPartitionSubIcon];
    [mutableDict setValue:self.area forKey:kLSPartitionArea];
    [mutableDict setValue:self.name forKey:kLSPartitionName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kLSPartitionCount];

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

    self.partitionIdentifier = [aDecoder decodeDoubleForKey:kLSPartitionId];
    self.subIcon = [aDecoder decodeObjectForKey:kLSPartitionSubIcon];
    self.area = [aDecoder decodeObjectForKey:kLSPartitionArea];
    self.name = [aDecoder decodeObjectForKey:kLSPartitionName];
    self.count = [aDecoder decodeDoubleForKey:kLSPartitionCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_partitionIdentifier forKey:kLSPartitionId];
    [aCoder encodeObject:_subIcon forKey:kLSPartitionSubIcon];
    [aCoder encodeObject:_area forKey:kLSPartitionArea];
    [aCoder encodeObject:_name forKey:kLSPartitionName];
    [aCoder encodeDouble:_count forKey:kLSPartitionCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSPartition *copy = [[LSPartition alloc] init];
    
    if (copy) {

        copy.partitionIdentifier = self.partitionIdentifier;
        copy.subIcon = [self.subIcon copyWithZone:zone];
        copy.area = [self.area copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.count = self.count;
    }
    
    return copy;
}


@end
