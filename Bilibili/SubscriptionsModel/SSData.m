//
//  SSData.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSData.h"
#import "SSFeeds.h"
#import "SSPage.h"


NSString *const kSSDataFeeds = @"feeds";
NSString *const kSSDataPage = @"page";


@interface SSData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSData

@synthesize feeds = _feeds;
@synthesize page = _page;


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
    NSObject *receivedSSFeeds = [dict objectForKey:kSSDataFeeds];
    NSMutableArray *parsedSSFeeds = [NSMutableArray array];
    if ([receivedSSFeeds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSSFeeds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSSFeeds addObject:[SSFeeds modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSSFeeds isKindOfClass:[NSDictionary class]]) {
       [parsedSSFeeds addObject:[SSFeeds modelObjectWithDictionary:(NSDictionary *)receivedSSFeeds]];
    }

    self.feeds = [NSArray arrayWithArray:parsedSSFeeds];
            self.page = [SSPage modelObjectWithDictionary:[dict objectForKey:kSSDataPage]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForFeeds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.feeds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFeeds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFeeds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFeeds] forKey:kSSDataFeeds];
    [mutableDict setValue:[self.page dictionaryRepresentation] forKey:kSSDataPage];

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

    self.feeds = [aDecoder decodeObjectForKey:kSSDataFeeds];
    self.page = [aDecoder decodeObjectForKey:kSSDataPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_feeds forKey:kSSDataFeeds];
    [aCoder encodeObject:_page forKey:kSSDataPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSData *copy = [[SSData alloc] init];
    
    if (copy) {

        copy.feeds = [self.feeds copyWithZone:zone];
        copy.page = [self.page copyWithZone:zone];
    }
    
    return copy;
}


@end
