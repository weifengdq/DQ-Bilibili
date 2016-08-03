//
//  BSBangumiScrollModel.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BSBangumiScrollModel.h"
#import "BSResult.h"


NSString *const kBSBangumiScrollModelMessage = @"message";
NSString *const kBSBangumiScrollModelResult = @"result";
NSString *const kBSBangumiScrollModelCode = @"code";


@interface BSBangumiScrollModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BSBangumiScrollModel

@synthesize message = _message;
@synthesize result = _result;
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
            self.message = [self objectOrNilForKey:kBSBangumiScrollModelMessage fromDictionary:dict];
            self.result = [BSResult modelObjectWithDictionary:[dict objectForKey:kBSBangumiScrollModelResult]];
            self.code = [[self objectOrNilForKey:kBSBangumiScrollModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kBSBangumiScrollModelMessage];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kBSBangumiScrollModelResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kBSBangumiScrollModelCode];

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

    self.message = [aDecoder decodeObjectForKey:kBSBangumiScrollModelMessage];
    self.result = [aDecoder decodeObjectForKey:kBSBangumiScrollModelResult];
    self.code = [aDecoder decodeDoubleForKey:kBSBangumiScrollModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kBSBangumiScrollModelMessage];
    [aCoder encodeObject:_result forKey:kBSBangumiScrollModelResult];
    [aCoder encodeDouble:_code forKey:kBSBangumiScrollModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    BSBangumiScrollModel *copy = [[BSBangumiScrollModel alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.result = [self.result copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
