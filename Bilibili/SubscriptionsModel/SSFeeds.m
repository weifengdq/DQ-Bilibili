//
//  SSFeeds.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSFeeds.h"
#import "SSAddition.h"
#import "SSSource.h"


NSString *const kSSFeedsAddId = @"add_id";
NSString *const kSSFeedsAddition = @"addition";
NSString *const kSSFeedsMcid = @"mcid";
NSString *const kSSFeedsId = @"id";
NSString *const kSSFeedsCtime = @"ctime";
NSString *const kSSFeedsSource = @"source";
NSString *const kSSFeedsSrcId = @"src_id";
NSString *const kSSFeedsType = @"type";


@interface SSFeeds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSFeeds

@synthesize addId = _addId;
@synthesize addition = _addition;
@synthesize mcid = _mcid;
@synthesize feedsIdentifier = _feedsIdentifier;
@synthesize ctime = _ctime;
@synthesize source = _source;
@synthesize srcId = _srcId;
@synthesize type = _type;


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
            self.addId = [[self objectOrNilForKey:kSSFeedsAddId fromDictionary:dict] doubleValue];
            self.addition = [SSAddition modelObjectWithDictionary:[dict objectForKey:kSSFeedsAddition]];
            self.mcid = [[self objectOrNilForKey:kSSFeedsMcid fromDictionary:dict] doubleValue];
            self.feedsIdentifier = [[self objectOrNilForKey:kSSFeedsId fromDictionary:dict] doubleValue];
            self.ctime = [[self objectOrNilForKey:kSSFeedsCtime fromDictionary:dict] doubleValue];
            self.source = [SSSource modelObjectWithDictionary:[dict objectForKey:kSSFeedsSource]];
            self.srcId = [[self objectOrNilForKey:kSSFeedsSrcId fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kSSFeedsType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addId] forKey:kSSFeedsAddId];
    [mutableDict setValue:[self.addition dictionaryRepresentation] forKey:kSSFeedsAddition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mcid] forKey:kSSFeedsMcid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.feedsIdentifier] forKey:kSSFeedsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ctime] forKey:kSSFeedsCtime];
    [mutableDict setValue:[self.source dictionaryRepresentation] forKey:kSSFeedsSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.srcId] forKey:kSSFeedsSrcId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kSSFeedsType];

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

    self.addId = [aDecoder decodeDoubleForKey:kSSFeedsAddId];
    self.addition = [aDecoder decodeObjectForKey:kSSFeedsAddition];
    self.mcid = [aDecoder decodeDoubleForKey:kSSFeedsMcid];
    self.feedsIdentifier = [aDecoder decodeDoubleForKey:kSSFeedsId];
    self.ctime = [aDecoder decodeDoubleForKey:kSSFeedsCtime];
    self.source = [aDecoder decodeObjectForKey:kSSFeedsSource];
    self.srcId = [aDecoder decodeDoubleForKey:kSSFeedsSrcId];
    self.type = [aDecoder decodeDoubleForKey:kSSFeedsType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_addId forKey:kSSFeedsAddId];
    [aCoder encodeObject:_addition forKey:kSSFeedsAddition];
    [aCoder encodeDouble:_mcid forKey:kSSFeedsMcid];
    [aCoder encodeDouble:_feedsIdentifier forKey:kSSFeedsId];
    [aCoder encodeDouble:_ctime forKey:kSSFeedsCtime];
    [aCoder encodeObject:_source forKey:kSSFeedsSource];
    [aCoder encodeDouble:_srcId forKey:kSSFeedsSrcId];
    [aCoder encodeDouble:_type forKey:kSSFeedsType];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSFeeds *copy = [[SSFeeds alloc] init];
    
    if (copy) {

        copy.addId = self.addId;
        copy.addition = [self.addition copyWithZone:zone];
        copy.mcid = self.mcid;
        copy.feedsIdentifier = self.feedsIdentifier;
        copy.ctime = self.ctime;
        copy.source = [self.source copyWithZone:zone];
        copy.srcId = self.srcId;
        copy.type = self.type;
    }
    
    return copy;
}


@end
