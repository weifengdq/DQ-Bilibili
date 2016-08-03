//
//  BSLatestUpdate.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BSLatestUpdate.h"
#import "BSList.h"


NSString *const kBSLatestUpdateList = @"list";
NSString *const kBSLatestUpdateUpdateCount = @"updateCount";


@interface BSLatestUpdate ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BSLatestUpdate

@synthesize list = _list;
@synthesize updateCount = _updateCount;


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
    NSObject *receivedBSList = [dict objectForKey:kBSLatestUpdateList];
    NSMutableArray *parsedBSList = [NSMutableArray array];
    if ([receivedBSList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBSList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBSList addObject:[BSList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBSList isKindOfClass:[NSDictionary class]]) {
       [parsedBSList addObject:[BSList modelObjectWithDictionary:(NSDictionary *)receivedBSList]];
    }

    self.list = [NSArray arrayWithArray:parsedBSList];
            self.updateCount = [self objectOrNilForKey:kBSLatestUpdateUpdateCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kBSLatestUpdateList];
    [mutableDict setValue:self.updateCount forKey:kBSLatestUpdateUpdateCount];

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

    self.list = [aDecoder decodeObjectForKey:kBSLatestUpdateList];
    self.updateCount = [aDecoder decodeObjectForKey:kBSLatestUpdateUpdateCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_list forKey:kBSLatestUpdateList];
    [aCoder encodeObject:_updateCount forKey:kBSLatestUpdateUpdateCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    BSLatestUpdate *copy = [[BSLatestUpdate alloc] init];
    
    if (copy) {

        copy.list = [self.list copyWithZone:zone];
        copy.updateCount = [self.updateCount copyWithZone:zone];
    }
    
    return copy;
}


@end
