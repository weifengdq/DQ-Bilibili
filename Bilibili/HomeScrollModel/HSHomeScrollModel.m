//
//  HSHomeScrollModel.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HSHomeScrollModel.h"
#import "HSData.h"


NSString *const kHSHomeScrollModelData = @"data";
NSString *const kHSHomeScrollModelCode = @"code";


@interface HSHomeScrollModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HSHomeScrollModel

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
    NSObject *receivedHSData = [dict objectForKey:kHSHomeScrollModelData];
    NSMutableArray *parsedHSData = [NSMutableArray array];
    if ([receivedHSData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHSData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHSData addObject:[HSData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHSData isKindOfClass:[NSDictionary class]]) {
       [parsedHSData addObject:[HSData modelObjectWithDictionary:(NSDictionary *)receivedHSData]];
    }

    self.data = [NSArray arrayWithArray:parsedHSData];
            self.code = [[self objectOrNilForKey:kHSHomeScrollModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kHSHomeScrollModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kHSHomeScrollModelCode];

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

    self.data = [aDecoder decodeObjectForKey:kHSHomeScrollModelData];
    self.code = [aDecoder decodeDoubleForKey:kHSHomeScrollModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kHSHomeScrollModelData];
    [aCoder encodeDouble:_code forKey:kHSHomeScrollModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    HSHomeScrollModel *copy = [[HSHomeScrollModel alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
