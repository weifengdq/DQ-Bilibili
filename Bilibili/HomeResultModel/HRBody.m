//
//  HRBody.m
//
//  Created by   on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HRBody.h"


NSString *const kHRBodyStyle = @"style";
NSString *const kHRBodyUp = @"up";
NSString *const kHRBodyParam = @"param";
NSString *const kHRBodyDesc1 = @"desc1";
NSString *const kHRBodyWidth = @"width";
NSString *const kHRBodyGoto = @"goto";
NSString *const kHRBodyTitle = @"title";
NSString *const kHRBodyUpFace = @"up_face";
NSString *const kHRBodyDanmaku = @"danmaku";
NSString *const kHRBodyCover = @"cover";
NSString *const kHRBodyHeight = @"height";
NSString *const kHRBodyOnline = @"online";
NSString *const kHRBodyPlay = @"play";


@interface HRBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HRBody

@synthesize style = _style;
@synthesize up = _up;
@synthesize param = _param;
@synthesize desc1 = _desc1;
@synthesize width = _width;
@synthesize gotoProperty = _gotoProperty;
@synthesize title = _title;
@synthesize upFace = _upFace;
@synthesize danmaku = _danmaku;
@synthesize cover = _cover;
@synthesize height = _height;
@synthesize online = _online;
@synthesize play = _play;


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
            self.style = [self objectOrNilForKey:kHRBodyStyle fromDictionary:dict];
            self.up = [self objectOrNilForKey:kHRBodyUp fromDictionary:dict];
            self.param = [self objectOrNilForKey:kHRBodyParam fromDictionary:dict];
            self.desc1 = [self objectOrNilForKey:kHRBodyDesc1 fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kHRBodyWidth fromDictionary:dict] doubleValue];
            self.gotoProperty = [self objectOrNilForKey:kHRBodyGoto fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHRBodyTitle fromDictionary:dict];
            self.upFace = [self objectOrNilForKey:kHRBodyUpFace fromDictionary:dict];
            self.danmaku = [self objectOrNilForKey:kHRBodyDanmaku fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kHRBodyCover fromDictionary:dict];
            self.height = [[self objectOrNilForKey:kHRBodyHeight fromDictionary:dict] doubleValue];
            self.online = [[self objectOrNilForKey:kHRBodyOnline fromDictionary:dict] doubleValue];
            self.play = [self objectOrNilForKey:kHRBodyPlay fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.style forKey:kHRBodyStyle];
    [mutableDict setValue:self.up forKey:kHRBodyUp];
    [mutableDict setValue:self.param forKey:kHRBodyParam];
    [mutableDict setValue:self.desc1 forKey:kHRBodyDesc1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kHRBodyWidth];
    [mutableDict setValue:self.gotoProperty forKey:kHRBodyGoto];
    [mutableDict setValue:self.title forKey:kHRBodyTitle];
    [mutableDict setValue:self.upFace forKey:kHRBodyUpFace];
    [mutableDict setValue:self.danmaku forKey:kHRBodyDanmaku];
    [mutableDict setValue:self.cover forKey:kHRBodyCover];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kHRBodyHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kHRBodyOnline];
    [mutableDict setValue:self.play forKey:kHRBodyPlay];

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

    self.style = [aDecoder decodeObjectForKey:kHRBodyStyle];
    self.up = [aDecoder decodeObjectForKey:kHRBodyUp];
    self.param = [aDecoder decodeObjectForKey:kHRBodyParam];
    self.desc1 = [aDecoder decodeObjectForKey:kHRBodyDesc1];
    self.width = [aDecoder decodeDoubleForKey:kHRBodyWidth];
    self.gotoProperty = [aDecoder decodeObjectForKey:kHRBodyGoto];
    self.title = [aDecoder decodeObjectForKey:kHRBodyTitle];
    self.upFace = [aDecoder decodeObjectForKey:kHRBodyUpFace];
    self.danmaku = [aDecoder decodeObjectForKey:kHRBodyDanmaku];
    self.cover = [aDecoder decodeObjectForKey:kHRBodyCover];
    self.height = [aDecoder decodeDoubleForKey:kHRBodyHeight];
    self.online = [aDecoder decodeDoubleForKey:kHRBodyOnline];
    self.play = [aDecoder decodeObjectForKey:kHRBodyPlay];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_style forKey:kHRBodyStyle];
    [aCoder encodeObject:_up forKey:kHRBodyUp];
    [aCoder encodeObject:_param forKey:kHRBodyParam];
    [aCoder encodeObject:_desc1 forKey:kHRBodyDesc1];
    [aCoder encodeDouble:_width forKey:kHRBodyWidth];
    [aCoder encodeObject:_gotoProperty forKey:kHRBodyGoto];
    [aCoder encodeObject:_title forKey:kHRBodyTitle];
    [aCoder encodeObject:_upFace forKey:kHRBodyUpFace];
    [aCoder encodeObject:_danmaku forKey:kHRBodyDanmaku];
    [aCoder encodeObject:_cover forKey:kHRBodyCover];
    [aCoder encodeDouble:_height forKey:kHRBodyHeight];
    [aCoder encodeDouble:_online forKey:kHRBodyOnline];
    [aCoder encodeObject:_play forKey:kHRBodyPlay];
}

- (id)copyWithZone:(NSZone *)zone
{
    HRBody *copy = [[HRBody alloc] init];
    
    if (copy) {

        copy.style = [self.style copyWithZone:zone];
        copy.up = [self.up copyWithZone:zone];
        copy.param = [self.param copyWithZone:zone];
        copy.desc1 = [self.desc1 copyWithZone:zone];
        copy.width = self.width;
        copy.gotoProperty = [self.gotoProperty copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.upFace = [self.upFace copyWithZone:zone];
        copy.danmaku = [self.danmaku copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
        copy.height = self.height;
        copy.online = self.online;
        copy.play = [self.play copyWithZone:zone];
    }
    
    return copy;
}


@end
