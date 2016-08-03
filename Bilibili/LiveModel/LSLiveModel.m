//
//  LSLiveModel.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSLiveModel.h"
#import "LSData.h"


NSString *const kLSLiveModelMessage = @"message";
NSString *const kLSLiveModelData = @"data";
NSString *const kLSLiveModelCode = @"code";


@interface LSLiveModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSLiveModel

@synthesize message = _message;
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
            self.message = [self objectOrNilForKey:kLSLiveModelMessage fromDictionary:dict];
            self.data = [LSData modelObjectWithDictionary:[dict objectForKey:kLSLiveModelData]];
            self.code = [[self objectOrNilForKey:kLSLiveModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kLSLiveModelMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kLSLiveModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kLSLiveModelCode];

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

    self.message = [aDecoder decodeObjectForKey:kLSLiveModelMessage];
    self.data = [aDecoder decodeObjectForKey:kLSLiveModelData];
    self.code = [aDecoder decodeDoubleForKey:kLSLiveModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kLSLiveModelMessage];
    [aCoder encodeObject:_data forKey:kLSLiveModelData];
    [aCoder encodeDouble:_code forKey:kLSLiveModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSLiveModel *copy = [[LSLiveModel alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
