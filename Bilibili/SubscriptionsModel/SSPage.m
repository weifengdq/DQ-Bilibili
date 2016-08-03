//
//  SSPage.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSPage.h"


NSString *const kSSPageCount = @"count";
NSString *const kSSPageNum = @"num";
NSString *const kSSPageSize = @"size";


@interface SSPage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSPage

@synthesize count = _count;
@synthesize num = _num;
@synthesize size = _size;


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
            self.count = [[self objectOrNilForKey:kSSPageCount fromDictionary:dict] doubleValue];
            self.num = [[self objectOrNilForKey:kSSPageNum fromDictionary:dict] doubleValue];
            self.size = [[self objectOrNilForKey:kSSPageSize fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kSSPageCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kSSPageNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kSSPageSize];

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

    self.count = [aDecoder decodeDoubleForKey:kSSPageCount];
    self.num = [aDecoder decodeDoubleForKey:kSSPageNum];
    self.size = [aDecoder decodeDoubleForKey:kSSPageSize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_count forKey:kSSPageCount];
    [aCoder encodeDouble:_num forKey:kSSPageNum];
    [aCoder encodeDouble:_size forKey:kSSPageSize];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSPage *copy = [[SSPage alloc] init];
    
    if (copy) {

        copy.count = self.count;
        copy.num = self.num;
        copy.size = self.size;
    }
    
    return copy;
}


@end
