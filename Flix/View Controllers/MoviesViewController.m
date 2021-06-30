//
//  MoviesViewController.m
//  Flix
//
//  Created by Ileen Fan on 6/23/21.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"
#import "Movie.h"
#import "MovieAPIManager.h"

@interface MoviesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *movies;

@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Movies";
        UINavigationBar *navigationBar = self.navigationController.navigationBar;
        [navigationBar setBackgroundImage:[UIImage imageNamed:@"banner"] forBarMetrics:UIBarMetricsDefault];
        navigationBar.tintColor = [UIColor colorWithRed:250 green:250 blue:250 alpha:0.8];
        
        NSShadow *shadow = [NSShadow new];
        shadow.shadowColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        shadow.shadowOffset = CGSizeMake(2, 2);
        shadow.shadowBlurRadius = 4;
        navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:22],
                                              NSForegroundColorAttributeName : [UIColor colorWithRed:250 green:250 blue:250 alpha:1],
                                              NSShadowAttributeName : shadow};
    
  
        
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.activityIndicator startAnimating];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.movies = [[NSMutableArray alloc] init];
    
    [self fetchMovies];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    [self.refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    
    
}

- (void)fetchMovies {
    
    MovieAPIManager *manager = [MovieAPIManager new];
    [manager fetchNowPlaying:^(NSArray *movies, NSError *error) {
        
        if (error){
            [self showNetworkError];
        } else {
            
        self.movies = movies;
        [self.tableView reloadData];
        
        }
        
        [self.refreshControl endRefreshing];
        [self.activityIndicator stopAnimating];
    }];
    
//    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//           if (error != nil) {
//               NSLog(@"%@", [error localizedDescription]);
//               [self showNetworkError];
//           }
//           else {
//               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//
//               //self.movies = dataDictionary[@"results"];
//               NSArray *dictionaries = dataDictionary[@"results"];
//               for (NSDictionary *dictionary in dictionaries){
//                   Movie *movie = [[Movie alloc]initWithDictionary:dictionary];
//
//                   [self.movies addObject:movie];
//               }
//
//
//
//               [self.tableView reloadData];
//
//           }
//                [self.refreshControl endRefreshing];
//                [self.activityIndicator stopAnimating];
//
//       }];
//    [task resume];
//
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    Movie *movie = self.movies[indexPath.row];
    //Movie *movie = self.movies[indexPath.row];
    // [cell setMovie:movie];
    
    [cell setMovie:movie];
    
    return cell;
    
    
//    cell.titleLabel.text = movie.title;
//    cell.synopsisLabel.text = movie.overview;
////
////    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
////    NSString *posterURLString = movie[@"poster_path"];
////    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
//
//    NSURL *posterURL = movie.posterURL;
////    cell.posterView.image = nil;
////    [cell.posterView setImageWithURL:posterURL];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:posterURL];
//
//    [cell.posterView setImageWithURLRequest:request placeholderImage:nil
//                                    success:^(NSURLRequest *imageRequest, NSHTTPURLResponse *imageResponse, UIImage *image) {
//
//                                        // imageResponse will be nil if the image is cached
//                                        if (imageResponse) {
//                                            cell.posterView.alpha = 0.0;
//                                            cell.posterView.image = image;
//
//                                            //Animate UIImageView back to alpha 1 over 0.7sec
//                                            [UIView animateWithDuration:0.7 animations:^{
//                                                cell.posterView.alpha = 1.0;
//                                            }];
//                                        }
//                                        else {
//                                            cell.posterView.image = image;
//                                        }
//                                    }
//                                    failure:^(NSURLRequest *request, NSHTTPURLResponse * response, NSError *error) {
//                                        // do something for the failure condition
//                                    }];
    
    return cell;
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UITableViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
    Movie *movie = self.movies[indexPath.row];
    
    DetailsViewController *detailsViewController = [segue destinationViewController];
    detailsViewController.movie = movie;
   
}

- (void)showNetworkError {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cannot Get Movies"
                                                                               message:@"The internet connection appears to be offline"
                                                                        preferredStyle:(UIAlertControllerStyleAlert)];
    
    // create a cancel action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                             // handle cancel response here. Doing nothing will dismiss the view.
                                                      }];
    // add the cancel action to the alertController
    [alert addAction:cancelAction];

    // create an OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Try Again"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
        [self.activityIndicator startAnimating];
        [self fetchMovies];
                                                     }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:^{
        // optional code for what happens after the alert controller has finished presenting
    }];
}


@end
