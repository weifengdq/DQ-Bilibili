//
//  HRResult.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HRResult.h"
#import "HRHead.h"
#import "HRBody.h"


NSString *const kHRResultType = @"type";
NSString *const kHRResultHead = @"head";
NSString *const kHRResultBody = @"body";


@interface HRResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HRResult

@synthesize type = _type;
@synthesize head = _head;
@synthesize body = _body;


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
            self.type = [self objectOrNilForKey:kHRResultType fromDictionary:dict];
            self.head = [HRHead modelObjectWithDictionary:[dict objectForKey:kHRResultHead]];
    NSObject *receivedHRBody = [dict objectForKey:kHRResultBody];
    NSMutableArray *parsedHRBody = [NSMutableArray array];
    if ([receivedHRBody isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHRBody) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHRBody addObject:[HRBody modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHRBody isKindOfClass:[NSDictionary class]]) {
       [parsedHRBody addObject:[HRBody modelObjectWithDictionary:(NSDictionary *)receivedHRBody]];
    }

    self.body = [NSArray arrayWithArray:parsedHRBody];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kHRResultType];
    [mutableDict setValue:[self.head dictionaryRepresentation] forKey:kHRResultHead];
    NSMutableArray *tempArrayForBody = [NSMutableArray array];
    for (NSObject *subArrayObject in self.body) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBody addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBody addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBody] forKey:kHRResultBody];

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

    self.type = [aDecoder decodeObjectForKey:kHRResultType];
    self.head = [aDecoder decodeObjectForKey:kHRResultHead];
    self.body = [aDecoder decodeObjectForKey:kHRResultBody];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kHRResultType];
    [aCoder encodeObject:_head forKey:kHRResultHead];
    [aCoder encodeObject:_body forKey:kHRResultBody];
}

- (id)copyWithZone:(NSZone *)zone
{
    HRResult *copy = [[HRResult alloc] init];
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.head = [self.head copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
    }
    
    return copy;
}


@end
