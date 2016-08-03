//
//  CATChild.m
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CATChild.h"
#import "CAT36.h"
#import "CAT3.h"
#import "CAT11.h"
#import "CAT160.h"
#import "CAT4.h"
#import "CAT5.h"
#import "CAT129.h"
#import "CAT23.h"
#import "CAT155.h"
#import "CAT13.h"
#import "CAT1.h"
#import "CAT119.h"


NSString *const kCATChild36 = @"36";
NSString *const kCATChild3 = @"3";
NSString *const kCATChild11 = @"11";
NSString *const kCATChild160 = @"160";
NSString *const kCATChild4 = @"4";
NSString *const kCATChild5 = @"5";
NSString *const kCATChild129 = @"129";
NSString *const kCATChild23 = @"23";
NSString *const kCATChild155 = @"155";
NSString *const kCATChild13 = @"13";
NSString *const kCATChild1 = @"1";
NSString *const kCATChild119 = @"119";


@interface CATChild ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CATChild

@synthesize c36 = _36;
@synthesize c3 = _3;
@synthesize c11 = _11;
@synthesize c160 = _160;
@synthesize c4 = _4;
@synthesize c5 = _5;
@synthesize c129 = _129;
@synthesize c23 = _23;
@synthesize c155 = _155;
@synthesize c13 = _13;
@synthesize c1 = _1;
@synthesize c119 = _119;


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
    NSObject *receivedCAT36 = [dict objectForKey:kCATChild36];
    NSMutableArray *parsedCAT36 = [NSMutableArray array];
    if ([receivedCAT36 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT36) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT36 addObject:[CAT36 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT36 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT36 addObject:[CAT36 modelObjectWithDictionary:(NSDictionary *)receivedCAT36]];
    }

    self.c36 = [NSArray arrayWithArray:parsedCAT36];
    NSObject *receivedCAT3 = [dict objectForKey:kCATChild3];
    NSMutableArray *parsedCAT3 = [NSMutableArray array];
    if ([receivedCAT3 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT3) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT3 addObject:[CAT3 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT3 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT3 addObject:[CAT3 modelObjectWithDictionary:(NSDictionary *)receivedCAT3]];
    }

    self.c3 = [NSArray arrayWithArray:parsedCAT3];
    NSObject *receivedCAT11 = [dict objectForKey:kCATChild11];
    NSMutableArray *parsedCAT11 = [NSMutableArray array];
    if ([receivedCAT11 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT11) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT11 addObject:[CAT11 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT11 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT11 addObject:[CAT11 modelObjectWithDictionary:(NSDictionary *)receivedCAT11]];
    }

    self.c11 = [NSArray arrayWithArray:parsedCAT11];
    NSObject *receivedCAT160 = [dict objectForKey:kCATChild160];
    NSMutableArray *parsedCAT160 = [NSMutableArray array];
    if ([receivedCAT160 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT160) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT160 addObject:[CAT160 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT160 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT160 addObject:[CAT160 modelObjectWithDictionary:(NSDictionary *)receivedCAT160]];
    }

    self.c160 = [NSArray arrayWithArray:parsedCAT160];
    NSObject *receivedCAT4 = [dict objectForKey:kCATChild4];
    NSMutableArray *parsedCAT4 = [NSMutableArray array];
    if ([receivedCAT4 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT4) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT4 addObject:[CAT4 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT4 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT4 addObject:[CAT4 modelObjectWithDictionary:(NSDictionary *)receivedCAT4]];
    }

    self.c4 = [NSArray arrayWithArray:parsedCAT4];
    NSObject *receivedCAT5 = [dict objectForKey:kCATChild5];
    NSMutableArray *parsedCAT5 = [NSMutableArray array];
    if ([receivedCAT5 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT5) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT5 addObject:[CAT5 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT5 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT5 addObject:[CAT5 modelObjectWithDictionary:(NSDictionary *)receivedCAT5]];
    }

    self.c5 = [NSArray arrayWithArray:parsedCAT5];
    NSObject *receivedCAT129 = [dict objectForKey:kCATChild129];
    NSMutableArray *parsedCAT129 = [NSMutableArray array];
    if ([receivedCAT129 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT129) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT129 addObject:[CAT129 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT129 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT129 addObject:[CAT129 modelObjectWithDictionary:(NSDictionary *)receivedCAT129]];
    }

    self.c129 = [NSArray arrayWithArray:parsedCAT129];
    NSObject *receivedCAT23 = [dict objectForKey:kCATChild23];
    NSMutableArray *parsedCAT23 = [NSMutableArray array];
    if ([receivedCAT23 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT23) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT23 addObject:[CAT23 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT23 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT23 addObject:[CAT23 modelObjectWithDictionary:(NSDictionary *)receivedCAT23]];
    }

    self.c23 = [NSArray arrayWithArray:parsedCAT23];
    NSObject *receivedCAT155 = [dict objectForKey:kCATChild155];
    NSMutableArray *parsedCAT155 = [NSMutableArray array];
    if ([receivedCAT155 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT155) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT155 addObject:[CAT155 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT155 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT155 addObject:[CAT155 modelObjectWithDictionary:(NSDictionary *)receivedCAT155]];
    }

    self.c155 = [NSArray arrayWithArray:parsedCAT155];
    NSObject *receivedCAT13 = [dict objectForKey:kCATChild13];
    NSMutableArray *parsedCAT13 = [NSMutableArray array];
    if ([receivedCAT13 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT13) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT13 addObject:[CAT13 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT13 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT13 addObject:[CAT13 modelObjectWithDictionary:(NSDictionary *)receivedCAT13]];
    }

    self.c13 = [NSArray arrayWithArray:parsedCAT13];
    NSObject *receivedCAT1 = [dict objectForKey:kCATChild1];
    NSMutableArray *parsedCAT1 = [NSMutableArray array];
    if ([receivedCAT1 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT1) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT1 addObject:[CAT1 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT1 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT1 addObject:[CAT1 modelObjectWithDictionary:(NSDictionary *)receivedCAT1]];
    }

    self.c1 = [NSArray arrayWithArray:parsedCAT1];
    NSObject *receivedCAT119 = [dict objectForKey:kCATChild119];
    NSMutableArray *parsedCAT119 = [NSMutableArray array];
    if ([receivedCAT119 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCAT119) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCAT119 addObject:[CAT119 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCAT119 isKindOfClass:[NSDictionary class]]) {
       [parsedCAT119 addObject:[CAT119 modelObjectWithDictionary:(NSDictionary *)receivedCAT119]];
    }

    self.c119 = [NSArray arrayWithArray:parsedCAT119];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayFor36 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c36) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor36 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor36 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor36] forKey:kCATChild36];
    NSMutableArray *tempArrayFor3 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c3) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor3 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor3 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor3] forKey:kCATChild3];
    NSMutableArray *tempArrayFor11 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c11) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor11 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor11 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor11] forKey:kCATChild11];
    NSMutableArray *tempArrayFor160 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c160) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor160 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor160 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor160] forKey:kCATChild160];
    NSMutableArray *tempArrayFor4 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c4) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor4 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor4 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor4] forKey:kCATChild4];
    NSMutableArray *tempArrayFor5 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c5) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor5 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor5 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor5] forKey:kCATChild5];
    NSMutableArray *tempArrayFor129 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c129) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor129 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor129 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor129] forKey:kCATChild129];
    NSMutableArray *tempArrayFor23 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c23) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor23 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor23 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor23] forKey:kCATChild23];
    NSMutableArray *tempArrayFor155 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c155) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor155 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor155 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor155] forKey:kCATChild155];
    NSMutableArray *tempArrayFor13 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c13) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor13 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor13 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor13] forKey:kCATChild13];
    NSMutableArray *tempArrayFor1 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c1) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor1 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor1 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor1] forKey:kCATChild1];
    NSMutableArray *tempArrayFor119 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.c119) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayFor119 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayFor119 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayFor119] forKey:kCATChild119];

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

    self.c36 = [aDecoder decodeObjectForKey:kCATChild36];
    self.c3 = [aDecoder decodeObjectForKey:kCATChild3];
    self.c11 = [aDecoder decodeObjectForKey:kCATChild11];
    self.c160 = [aDecoder decodeObjectForKey:kCATChild160];
    self.c4 = [aDecoder decodeObjectForKey:kCATChild4];
    self.c5 = [aDecoder decodeObjectForKey:kCATChild5];
    self.c129 = [aDecoder decodeObjectForKey:kCATChild129];
    self.c23 = [aDecoder decodeObjectForKey:kCATChild23];
    self.c155 = [aDecoder decodeObjectForKey:kCATChild155];
    self.c13 = [aDecoder decodeObjectForKey:kCATChild13];
    self.c1 = [aDecoder decodeObjectForKey:kCATChild1];
    self.c119 = [aDecoder decodeObjectForKey:kCATChild119];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_36 forKey:kCATChild36];
    [aCoder encodeObject:_3 forKey:kCATChild3];
    [aCoder encodeObject:_11 forKey:kCATChild11];
    [aCoder encodeObject:_160 forKey:kCATChild160];
    [aCoder encodeObject:_4 forKey:kCATChild4];
    [aCoder encodeObject:_5 forKey:kCATChild5];
    [aCoder encodeObject:_129 forKey:kCATChild129];
    [aCoder encodeObject:_23 forKey:kCATChild23];
    [aCoder encodeObject:_155 forKey:kCATChild155];
    [aCoder encodeObject:_13 forKey:kCATChild13];
    [aCoder encodeObject:_1 forKey:kCATChild1];
    [aCoder encodeObject:_119 forKey:kCATChild119];
}

- (id)copyWithZone:(NSZone *)zone
{
    CATChild *copy = [[CATChild alloc] init];
    
    if (copy) {

        copy.c36 = [self.c36 copyWithZone:zone];
        copy.c3 = [self.c3 copyWithZone:zone];
        copy.c11 = [self.c11 copyWithZone:zone];
        copy.c160 = [self.c160 copyWithZone:zone];
        copy.c4 = [self.c4 copyWithZone:zone];
        copy.c5 = [self.c5 copyWithZone:zone];
        copy.c129 = [self.c129 copyWithZone:zone];
        copy.c23 = [self.c23 copyWithZone:zone];
        copy.c155 = [self.c155 copyWithZone:zone];
        copy.c13 = [self.c13 copyWithZone:zone];
        copy.c1 = [self.c1 copyWithZone:zone];
        copy.c119 = [self.c119 copyWithZone:zone];
    }
    
    return copy;
}


@end
