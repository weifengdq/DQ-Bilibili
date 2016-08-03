//
//  SSAddition.m
//
//  Created by   on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSAddition.h"


NSString *const kSSAdditionVideoReview = @"video_review";
NSString *const kSSAdditionReview = @"review";
NSString *const kSSAdditionViewAt = @"view_at";
NSString *const kSSAdditionStatus = @"status";
NSString *const kSSAdditionMoney = @"money";
NSString *const kSSAdditionFavorites = @"favorites";
NSString *const kSSAdditionMid = @"mid";
NSString *const kSSAdditionLink = @"link";
NSString *const kSSAdditionTitle = @"title";
NSString *const kSSAdditionDuration = @"duration";
NSString *const kSSAdditionTypename = @"typename";
NSString *const kSSAdditionKeywords = @"keywords";
NSString *const kSSAdditionFlag = @"flag";
NSString *const kSSAdditionCreate = @"create";
NSString *const kSSAdditionAid = @"aid";
NSString *const kSSAdditionFavCreateAt = @"fav_create_at";
NSString *const kSSAdditionPic = @"pic";
NSString *const kSSAdditionPlay = @"play";
NSString *const kSSAdditionSubtitle = @"subtitle";
NSString *const kSSAdditionFavCreate = @"fav_create";
NSString *const kSSAdditionCoins = @"coins";
NSString *const kSSAdditionCredit = @"credit";
NSString *const kSSAdditionView = @"view";
NSString *const kSSAdditionTypeid = @"typeid";
NSString *const kSSAdditionAuthor = @"author";
NSString *const kSSAdditionDescription = @"description";


@interface SSAddition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSAddition

@synthesize videoReview = _videoReview;
@synthesize review = _review;
@synthesize viewAt = _viewAt;
@synthesize status = _status;
@synthesize money = _money;
@synthesize favorites = _favorites;
@synthesize mid = _mid;
@synthesize link = _link;
@synthesize title = _title;
@synthesize duration = _duration;
@synthesize typename = _typename;
@synthesize keywords = _keywords;
@synthesize flag = _flag;
@synthesize create = _create;
@synthesize aid = _aid;
@synthesize favCreateAt = _favCreateAt;
@synthesize pic = _pic;
@synthesize play = _play;
@synthesize subtitle = _subtitle;
@synthesize favCreate = _favCreate;
@synthesize coins = _coins;
@synthesize credit = _credit;
@synthesize view = _view;
@synthesize typeid = _typeid;
@synthesize author = _author;
@synthesize additionDescription = _additionDescription;


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
            self.videoReview = [[self objectOrNilForKey:kSSAdditionVideoReview fromDictionary:dict] doubleValue];
            self.review = [[self objectOrNilForKey:kSSAdditionReview fromDictionary:dict] doubleValue];
            self.viewAt = [self objectOrNilForKey:kSSAdditionViewAt fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kSSAdditionStatus fromDictionary:dict] doubleValue];
            self.money = [[self objectOrNilForKey:kSSAdditionMoney fromDictionary:dict] doubleValue];
            self.favorites = [[self objectOrNilForKey:kSSAdditionFavorites fromDictionary:dict] doubleValue];
            self.mid = [[self objectOrNilForKey:kSSAdditionMid fromDictionary:dict] doubleValue];
            self.link = [self objectOrNilForKey:kSSAdditionLink fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSSAdditionTitle fromDictionary:dict];
            self.duration = [self objectOrNilForKey:kSSAdditionDuration fromDictionary:dict];
            self.typename = [self objectOrNilForKey:kSSAdditionTypename fromDictionary:dict];
            self.keywords = [self objectOrNilForKey:kSSAdditionKeywords fromDictionary:dict];
            self.flag = [self objectOrNilForKey:kSSAdditionFlag fromDictionary:dict];
            self.create = [self objectOrNilForKey:kSSAdditionCreate fromDictionary:dict];
            self.aid = [[self objectOrNilForKey:kSSAdditionAid fromDictionary:dict] doubleValue];
            self.favCreateAt = [self objectOrNilForKey:kSSAdditionFavCreateAt fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kSSAdditionPic fromDictionary:dict];
            self.play = [[self objectOrNilForKey:kSSAdditionPlay fromDictionary:dict] doubleValue];
            self.subtitle = [self objectOrNilForKey:kSSAdditionSubtitle fromDictionary:dict];
            self.favCreate = [[self objectOrNilForKey:kSSAdditionFavCreate fromDictionary:dict] doubleValue];
            self.coins = [[self objectOrNilForKey:kSSAdditionCoins fromDictionary:dict] doubleValue];
            self.credit = [[self objectOrNilForKey:kSSAdditionCredit fromDictionary:dict] doubleValue];
            self.view = [[self objectOrNilForKey:kSSAdditionView fromDictionary:dict] doubleValue];
            self.typeid = [[self objectOrNilForKey:kSSAdditionTypeid fromDictionary:dict] doubleValue];
            self.author = [self objectOrNilForKey:kSSAdditionAuthor fromDictionary:dict];
            self.additionDescription = [self objectOrNilForKey:kSSAdditionDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.videoReview] forKey:kSSAdditionVideoReview];
    [mutableDict setValue:[NSNumber numberWithDouble:self.review] forKey:kSSAdditionReview];
    [mutableDict setValue:self.viewAt forKey:kSSAdditionViewAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kSSAdditionStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.money] forKey:kSSAdditionMoney];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favorites] forKey:kSSAdditionFavorites];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kSSAdditionMid];
    [mutableDict setValue:self.link forKey:kSSAdditionLink];
    [mutableDict setValue:self.title forKey:kSSAdditionTitle];
    [mutableDict setValue:self.duration forKey:kSSAdditionDuration];
    [mutableDict setValue:self.typename forKey:kSSAdditionTypename];
    [mutableDict setValue:self.keywords forKey:kSSAdditionKeywords];
    [mutableDict setValue:self.flag forKey:kSSAdditionFlag];
    [mutableDict setValue:self.create forKey:kSSAdditionCreate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.aid] forKey:kSSAdditionAid];
    [mutableDict setValue:self.favCreateAt forKey:kSSAdditionFavCreateAt];
    [mutableDict setValue:self.pic forKey:kSSAdditionPic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.play] forKey:kSSAdditionPlay];
    [mutableDict setValue:self.subtitle forKey:kSSAdditionSubtitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favCreate] forKey:kSSAdditionFavCreate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.coins] forKey:kSSAdditionCoins];
    [mutableDict setValue:[NSNumber numberWithDouble:self.credit] forKey:kSSAdditionCredit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.view] forKey:kSSAdditionView];
    [mutableDict setValue:[NSNumber numberWithDouble:self.typeid] forKey:kSSAdditionTypeid];
    [mutableDict setValue:self.author forKey:kSSAdditionAuthor];
    [mutableDict setValue:self.additionDescription forKey:kSSAdditionDescription];

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

    self.videoReview = [aDecoder decodeDoubleForKey:kSSAdditionVideoReview];
    self.review = [aDecoder decodeDoubleForKey:kSSAdditionReview];
    self.viewAt = [aDecoder decodeObjectForKey:kSSAdditionViewAt];
    self.status = [aDecoder decodeDoubleForKey:kSSAdditionStatus];
    self.money = [aDecoder decodeDoubleForKey:kSSAdditionMoney];
    self.favorites = [aDecoder decodeDoubleForKey:kSSAdditionFavorites];
    self.mid = [aDecoder decodeDoubleForKey:kSSAdditionMid];
    self.link = [aDecoder decodeObjectForKey:kSSAdditionLink];
    self.title = [aDecoder decodeObjectForKey:kSSAdditionTitle];
    self.duration = [aDecoder decodeObjectForKey:kSSAdditionDuration];
    self.typename = [aDecoder decodeObjectForKey:kSSAdditionTypename];
    self.keywords = [aDecoder decodeObjectForKey:kSSAdditionKeywords];
    self.flag = [aDecoder decodeObjectForKey:kSSAdditionFlag];
    self.create = [aDecoder decodeObjectForKey:kSSAdditionCreate];
    self.aid = [aDecoder decodeDoubleForKey:kSSAdditionAid];
    self.favCreateAt = [aDecoder decodeObjectForKey:kSSAdditionFavCreateAt];
    self.pic = [aDecoder decodeObjectForKey:kSSAdditionPic];
    self.play = [aDecoder decodeDoubleForKey:kSSAdditionPlay];
    self.subtitle = [aDecoder decodeObjectForKey:kSSAdditionSubtitle];
    self.favCreate = [aDecoder decodeDoubleForKey:kSSAdditionFavCreate];
    self.coins = [aDecoder decodeDoubleForKey:kSSAdditionCoins];
    self.credit = [aDecoder decodeDoubleForKey:kSSAdditionCredit];
    self.view = [aDecoder decodeDoubleForKey:kSSAdditionView];
    self.typeid = [aDecoder decodeDoubleForKey:kSSAdditionTypeid];
    self.author = [aDecoder decodeObjectForKey:kSSAdditionAuthor];
    self.additionDescription = [aDecoder decodeObjectForKey:kSSAdditionDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_videoReview forKey:kSSAdditionVideoReview];
    [aCoder encodeDouble:_review forKey:kSSAdditionReview];
    [aCoder encodeObject:_viewAt forKey:kSSAdditionViewAt];
    [aCoder encodeDouble:_status forKey:kSSAdditionStatus];
    [aCoder encodeDouble:_money forKey:kSSAdditionMoney];
    [aCoder encodeDouble:_favorites forKey:kSSAdditionFavorites];
    [aCoder encodeDouble:_mid forKey:kSSAdditionMid];
    [aCoder encodeObject:_link forKey:kSSAdditionLink];
    [aCoder encodeObject:_title forKey:kSSAdditionTitle];
    [aCoder encodeObject:_duration forKey:kSSAdditionDuration];
    [aCoder encodeObject:_typename forKey:kSSAdditionTypename];
    [aCoder encodeObject:_keywords forKey:kSSAdditionKeywords];
    [aCoder encodeObject:_flag forKey:kSSAdditionFlag];
    [aCoder encodeObject:_create forKey:kSSAdditionCreate];
    [aCoder encodeDouble:_aid forKey:kSSAdditionAid];
    [aCoder encodeObject:_favCreateAt forKey:kSSAdditionFavCreateAt];
    [aCoder encodeObject:_pic forKey:kSSAdditionPic];
    [aCoder encodeDouble:_play forKey:kSSAdditionPlay];
    [aCoder encodeObject:_subtitle forKey:kSSAdditionSubtitle];
    [aCoder encodeDouble:_favCreate forKey:kSSAdditionFavCreate];
    [aCoder encodeDouble:_coins forKey:kSSAdditionCoins];
    [aCoder encodeDouble:_credit forKey:kSSAdditionCredit];
    [aCoder encodeDouble:_view forKey:kSSAdditionView];
    [aCoder encodeDouble:_typeid forKey:kSSAdditionTypeid];
    [aCoder encodeObject:_author forKey:kSSAdditionAuthor];
    [aCoder encodeObject:_additionDescription forKey:kSSAdditionDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSAddition *copy = [[SSAddition alloc] init];
    
    if (copy) {

        copy.videoReview = self.videoReview;
        copy.review = self.review;
        copy.viewAt = [self.viewAt copyWithZone:zone];
        copy.status = self.status;
        copy.money = self.money;
        copy.favorites = self.favorites;
        copy.mid = self.mid;
        copy.link = [self.link copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.duration = [self.duration copyWithZone:zone];
        copy.typename = [self.typename copyWithZone:zone];
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.create = [self.create copyWithZone:zone];
        copy.aid = self.aid;
        copy.favCreateAt = [self.favCreateAt copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.play = self.play;
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.favCreate = self.favCreate;
        copy.coins = self.coins;
        copy.credit = self.credit;
        copy.view = self.view;
        copy.typeid = self.typeid;
        copy.author = [self.author copyWithZone:zone];
        copy.additionDescription = [self.additionDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
