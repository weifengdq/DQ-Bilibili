//
//  CAT129.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CAT129.h"


NSString *const kCAT129Tid = @"tid";
NSString *const kCAT129Typename = @"typename";


@interface CAT129 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CAT129

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
            self.tid = [[self objectOrNilForKey:kCAT129Tid fromDictionary:dict] doubleValue];
            self.typename = [self objectOrNilForKey:kCAT129Typename fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tid] forKey:kCAT129Tid];
    [mutableDict setValue:self.typename forKey:kCAT129Typename];

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

    self.tid = [aDecoder decodeDoubleForKey:kCAT129Tid];
    self.typename = [aDecoder decodeObjectForKey:kCAT129Typename];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tid forKey:kCAT129Tid];
    [aCoder encodeObject:_typename forKey:kCAT129Typename];
}

- (id)copyWithZone:(NSZone *)zone
{
    CAT129 *copy = [[CAT129 alloc] init];
    
    if (copy) {

        copy.tid = self.tid;
        copy.typename = [self.typename copyWithZone:zone];
    }
    
    return copy;
}


@end
