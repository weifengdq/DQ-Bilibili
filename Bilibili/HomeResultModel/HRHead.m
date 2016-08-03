//
//  HRHead.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HRHead.h"


NSString *const kHRHeadParam = @"param";
NSString *const kHRHeadStyle = @"style";
NSString *const kHRHeadTitle = @"title";
NSString *const kHRHeadCount = @"count";
NSString *const kHRHeadGoto = @"goto";


@interface HRHead ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HRHead

@synthesize param = _param;
@synthesize style = _style;
@synthesize title = _title;
@synthesize count = _count;
@synthesize gotoProperty = _gotoProperty;


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
            self.param = [self objectOrNilForKey:kHRHeadParam fromDictionary:dict];
            self.style = [self objectOrNilForKey:kHRHeadStyle fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHRHeadTitle fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kHRHeadCount fromDictionary:dict] doubleValue];
            self.gotoProperty = [self objectOrNilForKey:kHRHeadGoto fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.param forKey:kHRHeadParam];
    [mutableDict setValue:self.style forKey:kHRHeadStyle];
    [mutableDict setValue:self.title forKey:kHRHeadTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kHRHeadCount];
    [mutableDict setValue:self.gotoProperty forKey:kHRHeadGoto];

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

    self.param = [aDecoder decodeObjectForKey:kHRHeadParam];
    self.style = [aDecoder decodeObjectForKey:kHRHeadStyle];
    self.title = [aDecoder decodeObjectForKey:kHRHeadTitle];
    self.count = [aDecoder decodeDoubleForKey:kHRHeadCount];
    self.gotoProperty = [aDecoder decodeObjectForKey:kHRHeadGoto];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_param forKey:kHRHeadParam];
    [aCoder encodeObject:_style forKey:kHRHeadStyle];
    [aCoder encodeObject:_title forKey:kHRHeadTitle];
    [aCoder encodeDouble:_count forKey:kHRHeadCount];
    [aCoder encodeObject:_gotoProperty forKey:kHRHeadGoto];
}

- (id)copyWithZone:(NSZone *)zone
{
    HRHead *copy = [[HRHead alloc] init];
    
    if (copy) {

        copy.param = [self.param copyWithZone:zone];
        copy.style = [self.style copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.count = self.count;
        copy.gotoProperty = [self.gotoProperty copyWithZone:zone];
    }
    
    return copy;
}


@end
