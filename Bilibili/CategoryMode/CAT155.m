//
//  CAT155.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CAT155.h"


NSString *const kCAT155Tid = @"tid";
NSString *const kCAT155Typename = @"typename";


@interface CAT155 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CAT155

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
            self.tid = [[self objectOrNilForKey:kCAT155Tid fromDictionary:dict] doubleValue];
            self.typename = [self objectOrNilForKey:kCAT155Typename fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tid] forKey:kCAT155Tid];
    [mutableDict setValue:self.typename forKey:kCAT155Typename];

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

    self.tid = [aDecoder decodeDoubleForKey:kCAT155Tid];
    self.typename = [aDecoder decodeObjectForKey:kCAT155Typename];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tid forKey:kCAT155Tid];
    [aCoder encodeObject:_typename forKey:kCAT155Typename];
}

- (id)copyWithZone:(NSZone *)zone
{
    CAT155 *copy = [[CAT155 alloc] init];
    
    if (copy) {

        copy.tid = self.tid;
        copy.typename = [self.typename copyWithZone:zone];
    }
    
    return copy;
}


@end
