//
//  CATResult.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CATResult.h"
#import "CATChild.h"
#import "CATCovers.h"
#import "CATRoot.h"


NSString *const kCATResultChild = @"child";
NSString *const kCATResultCovers = @"covers";
NSString *const kCATResultRoot = @"root";


@interface CATResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CATResult

@synthesize child = _child;
@synthesize covers = _covers;
@synthesize root = _root;


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
            self.child = [CATChild modelObjectWithDictionary:[dict objectForKey:kCATResultChild]];
    NSObject *receivedCATCovers = [dict objectForKey:kCATResultCovers];
    NSMutableArray *parsedCATCovers = [NSMutableArray array];
    if ([receivedCATCovers isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCATCovers) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCATCovers addObject:[CATCovers modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCATCovers isKindOfClass:[NSDictionary class]]) {
       [parsedCATCovers addObject:[CATCovers modelObjectWithDictionary:(NSDictionary *)receivedCATCovers]];
    }

    self.covers = [NSArray arrayWithArray:parsedCATCovers];
    NSObject *receivedCATRoot = [dict objectForKey:kCATResultRoot];
    NSMutableArray *parsedCATRoot = [NSMutableArray array];
    if ([receivedCATRoot isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCATRoot) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCATRoot addObject:[CATRoot modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCATRoot isKindOfClass:[NSDictionary class]]) {
       [parsedCATRoot addObject:[CATRoot modelObjectWithDictionary:(NSDictionary *)receivedCATRoot]];
    }

    self.root = [NSArray arrayWithArray:parsedCATRoot];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.child dictionaryRepresentation] forKey:kCATResultChild];
    NSMutableArray *tempArrayForCovers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.covers) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCovers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCovers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCovers] forKey:kCATResultCovers];
    NSMutableArray *tempArrayForRoot = [NSMutableArray array];
    for (NSObject *subArrayObject in self.root) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRoot addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRoot addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRoot] forKey:kCATResultRoot];

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

    self.child = [aDecoder decodeObjectForKey:kCATResultChild];
    self.covers = [aDecoder decodeObjectForKey:kCATResultCovers];
    self.root = [aDecoder decodeObjectForKey:kCATResultRoot];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_child forKey:kCATResultChild];
    [aCoder encodeObject:_covers forKey:kCATResultCovers];
    [aCoder encodeObject:_root forKey:kCATResultRoot];
}

- (id)copyWithZone:(NSZone *)zone
{
    CATResult *copy = [[CATResult alloc] init];
    
    if (copy) {

        copy.child = [self.child copyWithZone:zone];
        copy.covers = [self.covers copyWithZone:zone];
        copy.root = [self.root copyWithZone:zone];
    }
    
    return copy;
}


@end
