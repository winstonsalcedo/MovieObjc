//
//  WFSMovieController.h
//  Movies2-ObJc
//
//  Created by winston salcedo on 6/2/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class WFSMovie;

@interface WFSMovieController : NSObject

@property (nonatomic, copy) NSArray<WFSMovie *> *movies;

+ (void)fetchMoviesWithTitle:(NSString *)title withCompletion:(void (^) (NSArray<WFSMovie *> * _Nullable))completion;


@end

NS_ASSUME_NONNULL_END
