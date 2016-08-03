//
//  CATCategory.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CATCategory.h"
#import "CATResult.h"


NSString *const kCATCategoryMessage = @"message";
NSString *const kCATCategoryResult = @"result";
NSString *const kCATCategoryCode = @"code";


@interface CATCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CATCategory

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
            self.message = [self objectOrNilForKey:kCATCategoryMessage fromDictionary:dict];
            self.result = [CATResult modelObjectWithDictionary:[dict objectForKey:kCATCategoryResult]];
            self.code = [[self objectOrNilForKey:kCATCategoryCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kCATCategoryMessage];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kCATCategoryResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kCATCategoryCode];

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

    self.message = [aDecoder decodeObjectForKey:kCATCategoryMessage];
    self.result = [aDecoder decodeObjectForKey:kCATCategoryResult];
    self.code = [aDecoder decodeDoubleForKey:kCATCategoryCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kCATCategoryMessage];
    [aCoder encodeObject:_result forKey:kCATCategoryResult];
    [aCoder encodeDouble:_code forKey:kCATCategoryCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    CATCategory *copy = [[CATCategory alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.result = [self.result copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
