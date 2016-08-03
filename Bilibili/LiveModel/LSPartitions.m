//
//  LSPartitions.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSPartitions.h"
#import "LSLives.h"
#import "LSPartition.h"


NSString *const kLSPartitionsLives = @"lives";
NSString *const kLSPartitionsPartition = @"partition";


@interface LSPartitions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSPartitions

@synthesize lives = _lives;
@synthesize partition = _partition;


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
    NSObject *receivedLSLives = [dict objectForKey:kLSPartitionsLives];
    NSMutableArray *parsedLSLives = [NSMutableArray array];
    if ([receivedLSLives isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLSLives) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLSLives addObject:[LSLives modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLSLives isKindOfClass:[NSDictionary class]]) {
       [parsedLSLives addObject:[LSLives modelObjectWithDictionary:(NSDictionary *)receivedLSLives]];
    }

    self.lives = [NSArray arrayWithArray:parsedLSLives];
            self.partition = [LSPartition modelObjectWithDictionary:[dict objectForKey:kLSPartitionsPartition]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLives = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lives) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLives addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLives addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLives] forKey:kLSPartitionsLives];
    [mutableDict setValue:[self.partition dictionaryRepresentation] forKey:kLSPartitionsPartition];

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

    self.lives = [aDecoder decodeObjectForKey:kLSPartitionsLives];
    self.partition = [aDecoder decodeObjectForKey:kLSPartitionsPartition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lives forKey:kLSPartitionsLives];
    [aCoder encodeObject:_partition forKey:kLSPartitionsPartition];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSPartitions *copy = [[LSPartitions alloc] init];
    
    if (copy) {

        copy.lives = [self.lives copyWithZone:zone];
        copy.partition = [self.partition copyWithZone:zone];
    }
    
    return copy;
}


@end
