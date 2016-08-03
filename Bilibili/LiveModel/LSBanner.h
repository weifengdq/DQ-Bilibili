//
//  LSBanner.h
//
//  Created by   on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LSBanner : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *link;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
