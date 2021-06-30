//
//  MovieCell.m
//  Flix
//
//  Created by Ileen Fan on 6/23/21.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMovie:(Movie *)movie {
    // Since we're replacing the default setter, we have to set the underlying private storage _movie ourselves.
    // _movie was an automatically declared variable with the @propery declaration.
    // You need to do this any time you create a custom setter.
    _movie = movie;

    self.titleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.overview;

//    self.posterView.image = nil;
//    if (self.movie.posterURL != nil) {
//        [self.posterView setImageWithURL:self.movie.posterUrl];
//    }
//
//    cell.titleLabel.text = movie.title;
//    cell.synopsisLabel.text = movie.overview;
//
//    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
//    NSString *posterURLString = movie[@"poster_path"];
//    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    
    NSURL *posterURL = movie.posterURL;
//    cell.posterView.image = nil;
//    [cell.posterView setImageWithURL:posterURL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:posterURL];

    [self.posterView setImageWithURLRequest:request placeholderImage:nil
                                    success:^(NSURLRequest *imageRequest, NSHTTPURLResponse *imageResponse, UIImage *image) {
                                        
                                        // imageResponse will be nil if the image is cached
                                        if (imageResponse) {
                                            self.posterView.alpha = 0.0;
                                            self.posterView.image = image;
                                            
                                            //Animate UIImageView back to alpha 1 over 0.7sec
                                            [UIView animateWithDuration:0.7 animations:^{
                                                self.posterView.alpha = 1.0;
                                            }];
                                        }
                                        else {
                                            self.posterView.image = image;
                                        }
                                    }
                                    failure:^(NSURLRequest *request, NSHTTPURLResponse * response, NSError *error) {
                                        // do something for the failure condition
                                    }];
}

@end
