//
//  CATRoot.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CATRoot.h"


NSString *const kCATRootTid = @"tid";
NSString *const kCATRootSearchname = @"searchname";
NSString *const kCATRootCaptionname = @"captionname";
NSString *const kCATRootTypename = @"typename";


@interface CATRoot ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CATRoot

@synthesize tid = _tid;
@synthesize searchname = _searchname;
@synthesize captionname = _captionname;
@synthesize typename = _typename;


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
            self.tid = [[self objectOrNilForKey:kCATRootTid fromDictionary:dict] doubleValue];
            self.searchname = [self objectOrNilForKey:kCATRootSearchname fromDictionary:dict];
            self.captionname = [self objectOrNilForKey:kCATRootCaptionname fromDictionary:dict];
            self.typename = [self objectOrNilForKey:kCATRootTypename fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tid] forKey:kCATRootTid];
    [mutableDict setValue:self.searchname forKey:kCATRootSearchname];
    [mutableDict setValue:self.captionname forKey:kCATRootCaptionname];
    [mutableDict setValue:self.typename forKey:kCATRootTypename];

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

    self.tid = [aDecoder decodeDoubleForKey:kCATRootTid];
    self.searchname = [aDecoder decodeObjectForKey:kCATRootSearchname];
    self.captionname = [aDecoder decodeObjectForKey:kCATRootCaptionname];
    self.typename = [aDecoder decodeObjectForKey:kCATRootTypename];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tid forKey:kCATRootTid];
    [aCoder encodeObject:_searchname forKey:kCATRootSearchname];
    [aCoder encodeObject:_captionname forKey:kCATRootCaptionname];
    [aCoder encodeObject:_typename forKey:kCATRootTypename];
}

- (id)copyWithZone:(NSZone *)zone
{
    CATRoot *copy = [[CATRoot alloc] init];
    
    if (copy) {

        copy.tid = self.tid;
        copy.searchname = [self.searchname copyWithZone:zone];
        copy.captionname = [self.captionname copyWithZone:zone];
        copy.typename = [self.typename copyWithZone:zone];
    }
    
    return copy;
}


@end
