//
//  WFSMovieController.m
//  Movies2-ObJc
//
//  Created by winston salcedo on 6/2/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//


#import "WFSMovieController.h"
#import "WFSMovie.h"

@implementation WFSMovieController

+ (void)fetchMoviesWithTitle:(NSString *)title withCompletion:(void (^)(NSArray<WFSMovie *> * _Nullable))completion
{
    // MARK: - Properties
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.themoviedb.org"];
    NSURLQueryItem *apiSecret = [NSURLQueryItem queryItemWithName:@"api_key" value:@"8ce95fe075508a36430562dfcd45487b"];
    
    // adding components to baseUrl
    NSURL *url = [[[baseUrl URLByAppendingPathComponent:@"3"] URLByAppendingPathComponent:@"search"] URLByAppendingPathComponent:@"movie"];
    
    // adding query items to url
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *query = [NSURLQueryItem queryItemWithName:@"query" value:title];

    // combining query items into array
    [components setQueryItems:@[query, apiSecret]];
    
    // getting the final url with components and query items
    NSURL *fullUrl = components.URL;
    
    NSLog(@"Movie url: %@", [fullUrl absoluteString]);
    
    
    // MARK: - URLSession and dataTask
    // making the fetch call to the API
    [[[NSURLSession sharedSession] dataTaskWithURL:fullUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // checking for errors if the call fails
        if (error) {
            NSLog(@"Error from URLSession: :> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // checking to see if there is data
        if (!data) {
            NSLog(@"Error in URLSession data: :> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // Serialization of data into usable info
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error) {
            NSLog(@"Error with JSONSerialization: : %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // creating an array to return the movie data
        NSMutableArray *movieArray = [NSMutableArray new];
        
        // fetching the array of movies from the json
        NSArray *fetchedMoviesArray = jsonDictionary[@"results"];
        
        // going through the movies and adding the movie info to the array
        for (NSDictionary *movies in fetchedMoviesArray) {
            WFSMovie *movie = [[WFSMovie alloc] initWithDictionary:movies];
            [movieArray addObject:movie];
        }
        
        // returning the array of movies
        completion(movieArray);
    }]resume];
}
@end
