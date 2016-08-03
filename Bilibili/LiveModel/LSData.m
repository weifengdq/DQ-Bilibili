//
//  LSData.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSData.h"
#import "LSBanner.h"
#import "LSPartitions.h"
#import "LSEntranceIcons.h"


NSString *const kLSDataBanner = @"banner";
NSString *const kLSDataPartitions = @"partitions";
NSString *const kLSDataEntranceIcons = @"entranceIcons";


@interface LSData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSData

@synthesize banner = _banner;
@synthesize partitions = _partitions;
@synthesize entranceIcons = _entranceIcons;


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
    NSObject *receivedLSBanner = [dict objectForKey:kLSDataBanner];
    NSMutableArray *parsedLSBanner = [NSMutableArray array];
    if ([receivedLSBanner isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLSBanner) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLSBanner addObject:[LSBanner modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLSBanner isKindOfClass:[NSDictionary class]]) {
       [parsedLSBanner addObject:[LSBanner modelObjectWithDictionary:(NSDictionary *)receivedLSBanner]];
    }

    self.banner = [NSArray arrayWithArray:parsedLSBanner];
    NSObject *receivedLSPartitions = [dict objectForKey:kLSDataPartitions];
    NSMutableArray *parsedLSPartitions = [NSMutableArray array];
    if ([receivedLSPartitions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLSPartitions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLSPartitions addObject:[LSPartitions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLSPartitions isKindOfClass:[NSDictionary class]]) {
       [parsedLSPartitions addObject:[LSPartitions modelObjectWithDictionary:(NSDictionary *)receivedLSPartitions]];
    }

    self.partitions = [NSArray arrayWithArray:parsedLSPartitions];
    NSObject *receivedLSEntranceIcons = [dict objectForKey:kLSDataEntranceIcons];
    NSMutableArray *parsedLSEntranceIcons = [NSMutableArray array];
    if ([receivedLSEntranceIcons isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLSEntranceIcons) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLSEntranceIcons addObject:[LSEntranceIcons modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLSEntranceIcons isKindOfClass:[NSDictionary class]]) {
       [parsedLSEntranceIcons addObject:[LSEntranceIcons modelObjectWithDictionary:(NSDictionary *)receivedLSEntranceIcons]];
    }

    self.entranceIcons = [NSArray arrayWithArray:parsedLSEntranceIcons];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForBanner = [NSMutableArray array];
    for (NSObject *subArrayObject in self.banner) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBanner addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBanner addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBanner] forKey:kLSDataBanner];
    NSMutableArray *tempArrayForPartitions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.partitions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPartitions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPartitions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPartitions] forKey:kLSDataPartitions];
    NSMutableArray *tempArrayForEntranceIcons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.entranceIcons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEntranceIcons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEntranceIcons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEntranceIcons] forKey:kLSDataEntranceIcons];

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

    self.banner = [aDecoder decodeObjectForKey:kLSDataBanner];
    self.partitions = [aDecoder decodeObjectForKey:kLSDataPartitions];
    self.entranceIcons = [aDecoder decodeObjectForKey:kLSDataEntranceIcons];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_banner forKey:kLSDataBanner];
    [aCoder encodeObject:_partitions forKey:kLSDataPartitions];
    [aCoder encodeObject:_entranceIcons forKey:kLSDataEntranceIcons];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSData *copy = [[LSData alloc] init];
    
    if (copy) {

        copy.banner = [self.banner copyWithZone:zone];
        copy.partitions = [self.partitions copyWithZone:zone];
        copy.entranceIcons = [self.entranceIcons copyWithZone:zone];
    }
    
    return copy;
}


@end
