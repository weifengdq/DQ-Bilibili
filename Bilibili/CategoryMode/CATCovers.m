//
//  CATCovers.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CATCovers.h"


NSString *const kCATCoversTid = @"tid";
NSString *const kCATCoversCover = @"cover";


@interface CATCovers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CATCovers

@synthesize tid = _tid;
@synthesize cover = _cover;


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
            self.tid = [[self objectOrNilForKey:kCATCoversTid fromDictionary:dict] doubleValue];
            self.cover = [self objectOrNilForKey:kCATCoversCover fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tid] forKey:kCATCoversTid];
    [mutableDict setValue:self.cover forKey:kCATCoversCover];

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

    self.tid = [aDecoder decodeDoubleForKey:kCATCoversTid];
    self.cover = [aDecoder decodeObjectForKey:kCATCoversCover];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tid forKey:kCATCoversTid];
    [aCoder encodeObject:_cover forKey:kCATCoversCover];
}

- (id)copyWithZone:(NSZone *)zone
{
    CATCovers *copy = [[CATCovers alloc] init];
    
    if (copy) {

        copy.tid = self.tid;
        copy.cover = [self.cover copyWithZone:zone];
    }
    
    return copy;
}


@end
