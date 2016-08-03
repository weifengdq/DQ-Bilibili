//
//  CAT3.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CAT3.h"


NSString *const kCAT3Tid = @"tid";
NSString *const kCAT3Typename = @"typename";


@interface CAT3 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CAT3

@synthesize tid = _tid;
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
            self.tid = [[self objectOrNilForKey:kCAT3Tid fromDictionary:dict] doubleValue];
            self.typename = [self objectOrNilForKey:kCAT3Typename fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tid] forKey:kCAT3Tid];
    [mutableDict setValue:self.typename forKey:kCAT3Typename];

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

    self.tid = [aDecoder decodeDoubleForKey:kCAT3Tid];
    self.typename = [aDecoder decodeObjectForKey:kCAT3Typename];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tid forKey:kCAT3Tid];
    [aCoder encodeObject:_typename forKey:kCAT3Typename];
}

- (id)copyWithZone:(NSZone *)zone
{
    CAT3 *copy = [[CAT3 alloc] init];
    
    if (copy) {

        copy.tid = self.tid;
        copy.typename = [self.typename copyWithZone:zone];
    }
    
    return copy;
}


@end
