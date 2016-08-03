//
//  LSCover.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSCover.h"


NSString *const kLSCoverSrc = @"src";
NSString *const kLSCoverWidth = @"width";
NSString *const kLSCoverHeight = @"height";


@interface LSCover ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSCover

@synthesize src = _src;
@synthesize width = _width;
@synthesize height = _height;


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
            self.src = [self objectOrNilForKey:kLSCoverSrc fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kLSCoverWidth fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kLSCoverHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.src forKey:kLSCoverSrc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kLSCoverWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kLSCoverHeight];

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

    self.src = [aDecoder decodeObjectForKey:kLSCoverSrc];
    self.width = [aDecoder decodeDoubleForKey:kLSCoverWidth];
    self.height = [aDecoder decodeDoubleForKey:kLSCoverHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_src forKey:kLSCoverSrc];
    [aCoder encodeDouble:_width forKey:kLSCoverWidth];
    [aCoder encodeDouble:_height forKey:kLSCoverHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSCover *copy = [[LSCover alloc] init];
    
    if (copy) {

        copy.src = [self.src copyWithZone:zone];
        copy.width = self.width;
        copy.height = self.height;
    }
    
    return copy;
}


@end
