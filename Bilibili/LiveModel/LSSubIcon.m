//
//  LSSubIcon.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LSSubIcon.h"


NSString *const kLSSubIconSrc = @"src";
NSString *const kLSSubIconWidth = @"width";
NSString *const kLSSubIconHeight = @"height";


@interface LSSubIcon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LSSubIcon

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
            self.src = [self objectOrNilForKey:kLSSubIconSrc fromDictionary:dict];
            self.width = [self objectOrNilForKey:kLSSubIconWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kLSSubIconHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.src forKey:kLSSubIconSrc];
    [mutableDict setValue:self.width forKey:kLSSubIconWidth];
    [mutableDict setValue:self.height forKey:kLSSubIconHeight];

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

    self.src = [aDecoder decodeObjectForKey:kLSSubIconSrc];
    self.width = [aDecoder decodeObjectForKey:kLSSubIconWidth];
    self.height = [aDecoder decodeObjectForKey:kLSSubIconHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_src forKey:kLSSubIconSrc];
    [aCoder encodeObject:_width forKey:kLSSubIconWidth];
    [aCoder encodeObject:_height forKey:kLSSubIconHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    LSSubIcon *copy = [[LSSubIcon alloc] init];
    
    if (copy) {

        copy.src = [self.src copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
