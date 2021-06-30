//
//  Movie.m
//  Flix
//
//  Created by Ileen Fan on 6/30/21.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    self.title = dictionary[@"title"];
    self.overview = dictionary[@"overview"];
    self.releaseDate = dictionary[@"release_date"];
    self.movieID = dictionary[@"id"];
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = dictionary[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    
    self.posterURL = [NSURL URLWithString:fullPosterURLString];
    
    NSString *backdropURLString = dictionary[@"backdrop_path"];
    NSString *fullbackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    
    self.backdropURL = [NSURL URLWithString:fullbackdropURLString];
    
    return self;
}


+ (NSMutableArray *)moviesWithDictionaries:(NSMutableArray *)dictionaries{
    NSMutableArray *movies = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries){
        Movie *movie = [[Movie alloc]initWithDictionary:dictionary];
        
        [movies addObject:movie];
    }
    
    return movies;
}

@end


