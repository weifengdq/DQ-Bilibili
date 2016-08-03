//
//  SSSubModel.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSSubModel.h"
#import "SSData.h"


NSString *const kSSSubModelData = @"data";
NSString *const kSSSubModelCode = @"code";


@interface SSSubModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSSubModel

@synthesize data = _data;
@synthesize code = _code;


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
            self.data = [SSData modelObjectWithDictionary:[dict objectForKey:kSSSubModelData]];
            self.code = [[self objectOrNilForKey:kSSSubModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kSSSubModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kSSSubModelCode];

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

    self.data = [aDecoder decodeObjectForKey:kSSSubModelData];
    self.code = [aDecoder decodeDoubleForKey:kSSSubModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kSSSubModelData];
    [aCoder encodeDouble:_code forKey:kSSSubModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSSubModel *copy = [[SSSubModel alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
