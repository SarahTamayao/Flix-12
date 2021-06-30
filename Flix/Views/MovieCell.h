//
//  MovieCell.h
//  Flix
//
//  Created by Ileen Fan on 6/23/21.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "UIImageView+AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (strong, nonatomic) Movie *movie;

- (void)setMovie:(Movie *)movie;

@end

NS_ASSUME_NONNULL_END
