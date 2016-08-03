//
//  CAT1.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CAT1.h"


NSString *const kCAT1Tid = @"tid";
NSString *const kCAT1Typename = @"typename";


@interface CAT1 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CAT1

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
            self.tid = [[self objectOrNilForKey:kCAT1Tid fromDictionary:dict] doubleValue];
            self.typename = [self objectOrNilForKey:kCAT1Typename fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tid] forKey:kCAT1Tid];
    [mutableDict setValue:self.typename forKey:kCAT1Typename];

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

    self.tid = [aDecoder decodeDoubleForKey:kCAT1Tid];
    self.typename = [aDecoder decodeObjectForKey:kCAT1Typename];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tid forKey:kCAT1Tid];
    [aCoder encodeObject:_typename forKey:kCAT1Typename];
}

- (id)copyWithZone:(NSZone *)zone
{
    CAT1 *copy = [[CAT1 alloc] init];
    
    if (copy) {

        copy.tid = self.tid;
        copy.typename = [self.typename copyWithZone:zone];
    }
    
    return copy;
}


@end
