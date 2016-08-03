//
//  HRHomeResultModel.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HRHomeResultModel.h"
#import "HRResult.h"


NSString *const kHRHomeResultModelResult = @"result";
NSString *const kHRHomeResultModelCode = @"code";


@interface HRHomeResultModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HRHomeResultModel

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
    NSObject *receivedHRResult = [dict objectForKey:kHRHomeResultModelResult];
    NSMutableArray *parsedHRResult = [NSMutableArray array];
    if ([receivedHRResult isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHRResult) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHRResult addObject:[HRResult modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHRResult isKindOfClass:[NSDictionary class]]) {
       [parsedHRResult addObject:[HRResult modelObjectWithDictionary:(NSDictionary *)receivedHRResult]];
    }

    self.result = [NSArray arrayWithArray:parsedHRResult];
            self.code = [[self objectOrNilForKey:kHRHomeResultModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForResult = [NSMutableArray array];
    for (NSObject *subArrayObject in self.result) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResult addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResult addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResult] forKey:kHRHomeResultModelResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kHRHomeResultModelCode];

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

    self.result = [aDecoder decodeObjectForKey:kHRHomeResultModelResult];
    self.code = [aDecoder decodeDoubleForKey:kHRHomeResultModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kHRHomeResultModelResult];
    [aCoder encodeDouble:_code forKey:kHRHomeResultModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    HRHomeResultModel *copy = [[HRHomeResultModel alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
