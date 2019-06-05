//
//  WFSMovie.h
//  Movies2-ObJc
//
//  Created by winston salcedo on 6/2/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFSMovie : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, readonly) NSString *overview;


-(instancetype)initWithTitle: (NSString *)title rating:(NSNumber *)rating overview:(NSString *)overview;

@end

@interface WFSMovie (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *,id> *)dictionary;

@end


NS_ASSUME_NONNULL_END
