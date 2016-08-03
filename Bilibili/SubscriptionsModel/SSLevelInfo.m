//
//  SSLevelInfo.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSLevelInfo.h"


NSString *const kSSLevelInfoCurrentLevel = @"current_level";
NSString *const kSSLevelInfoCurrentMin = @"current_min";
NSString *const kSSLevelInfoCurrentExp = @"current_exp";
NSString *const kSSLevelInfoNextExp = @"next_exp";


@interface SSLevelInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSLevelInfo

@synthesize currentLevel = _currentLevel;
@synthesize currentMin = _currentMin;
@synthesize currentExp = _currentExp;
@synthesize nextExp = _nextExp;


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
            self.currentLevel = [[self objectOrNilForKey:kSSLevelInfoCurrentLevel fromDictionary:dict] doubleValue];
            self.currentMin = [[self objectOrNilForKey:kSSLevelInfoCurrentMin fromDictionary:dict] doubleValue];
            self.currentExp = [[self objectOrNilForKey:kSSLevelInfoCurrentExp fromDictionary:dict] doubleValue];
            self.nextExp = [self objectOrNilForKey:kSSLevelInfoNextExp fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentLevel] forKey:kSSLevelInfoCurrentLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentMin] forKey:kSSLevelInfoCurrentMin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentExp] forKey:kSSLevelInfoCurrentExp];
    [mutableDict setValue:self.nextExp forKey:kSSLevelInfoNextExp];

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

    self.currentLevel = [aDecoder decodeDoubleForKey:kSSLevelInfoCurrentLevel];
    self.currentMin = [aDecoder decodeDoubleForKey:kSSLevelInfoCurrentMin];
    self.currentExp = [aDecoder decodeDoubleForKey:kSSLevelInfoCurrentExp];
    self.nextExp = [aDecoder decodeObjectForKey:kSSLevelInfoNextExp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currentLevel forKey:kSSLevelInfoCurrentLevel];
    [aCoder encodeDouble:_currentMin forKey:kSSLevelInfoCurrentMin];
    [aCoder encodeDouble:_currentExp forKey:kSSLevelInfoCurrentExp];
    [aCoder encodeObject:_nextExp forKey:kSSLevelInfoNextExp];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSLevelInfo *copy = [[SSLevelInfo alloc] init];
    
    if (copy) {

        copy.currentLevel = self.currentLevel;
        copy.currentMin = self.currentMin;
        copy.currentExp = self.currentExp;
        copy.nextExp = [self.nextExp copyWithZone:zone];
    }
    
    return copy;
}


@end
