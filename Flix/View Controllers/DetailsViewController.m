//
//  DetailsViewController.m
//  Flix
//
//  Created by Ileen Fan on 6/23/21.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TrailerViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
//    NSString *posterURLString = self.movie[@"poster_path"];
//    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
//
    //NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    NSURL *posterURL = self.movie.posterURL;
    
    [self.posterView setImageWithURL:posterURL];
    
//    NSString *backdropURLString = self.movie[@"backdrop_path"];
//    NSString *fullbackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
//    
//    NSURL *backdropURL = [NSURL URLWithString:fullbackdropURLString];
    
    [self.backdropView setImageWithURL:self.movie.backdropURL];
    
    self.titleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.overview;
    
    NSString *release_date = self.movie.releaseDate;
    self.dateLabel.text = [self parseDate:release_date];
    
//    UITabBar *tabBar = self.tabBarController.tabBar;
//    [tabBar setBackgroundImage:[UIImage imageNamed:@"banner"] forBarMetrics:UIBarMetricsDefault];
//    tabBar.tintColor = [UIColor colorWithRed:1.5 green:0.5 blue:0.5 alpha:0.8];
//
   
    
    
    [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit];
    [self.dateLabel sizeToFit];
}

//"2021-06-17"
-(NSString *)parseDate:(NSString *)date{
    NSString *string_date = @"";
    NSDictionary *month_pairs = @{@"01" : @"January",
        @"02" : @"February",
        @"03" : @"March",
        @"04" : @"April",
        @"05" : @"May",
        @"06" : @"June",
        @"07" : @"July",
        @"08" : @"August",
        @"09" : @"September",
        @"10" : @"October",
        @"11" : @"November",
        @"12" : @"December"};
    
    NSArray *date_arr = [date componentsSeparatedByString:@"-"];
    
    NSString *month = month_pairs[date_arr[1]];
    NSString *day = date_arr[2];
    NSString *year = date_arr[0];
    
    string_date = [string_date stringByAppendingString:month];
    string_date = [string_date stringByAppendingString:@" "];
    string_date = [string_date stringByAppendingString:day];
    string_date = [string_date stringByAppendingString:@", "];
    string_date = [string_date stringByAppendingString:year];
    
    
    return string_date;
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TrailerViewController *tvc = segue.destinationViewController;
    tvc.movieID = self.movie.movieID;
}


@end
