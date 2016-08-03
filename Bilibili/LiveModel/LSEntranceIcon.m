//
//  LSEntranceIcon.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSEntranceIcon.h"


NSString *const kLSEntranceIconSrc = @"src";
NSString *const kLSEntranceIconWidth = @"width";
NSString *const kLSEntranceIconHeight = @"height";


@interface LSEntranceIcon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSEntranceIcon

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
            self.src = [self objectOrNilForKey:kLSEntranceIconSrc fromDictionary:dict];
            self.width = [self objectOrNilForKey:kLSEntranceIconWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kLSEntranceIconHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.src forKey:kLSEntranceIconSrc];
    [mutableDict setValue:self.width forKey:kLSEntranceIconWidth];
    [mutableDict setValue:self.height forKey:kLSEntranceIconHeight];

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

    self.src = [aDecoder decodeObjectForKey:kLSEntranceIconSrc];
    self.width = [aDecoder decodeObjectForKey:kLSEntranceIconWidth];
    self.height = [aDecoder decodeObjectForKey:kLSEntranceIconHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_src forKey:kLSEntranceIconSrc];
    [aCoder encodeObject:_width forKey:kLSEntranceIconWidth];
    [aCoder encodeObject:_height forKey:kLSEntranceIconHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSEntranceIcon *copy = [[LSEntranceIcon alloc] init];
    
    if (copy) {

        copy.src = [self.src copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
