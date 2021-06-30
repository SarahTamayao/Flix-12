//
//  Movie.h
//  Flix
//
//  Created by Ileen Fan on 6/30/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *posterURL;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSURL *backdropURL;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSString *movieID;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
