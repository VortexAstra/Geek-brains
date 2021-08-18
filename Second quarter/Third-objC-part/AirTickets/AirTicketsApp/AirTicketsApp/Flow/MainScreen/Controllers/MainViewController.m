//
//  ViewController.m
//  AirTicketsApp
//
//  Created by artem.ustinov on 17.07.2021.
//

#import "MainViewController.h"
#import "DataManager.h"
#import "PlaceViewController.h"
#import "APIManager.h"
#import "TicketsViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic) SearchRequest searchRequest;
@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [[DataManager sharedInstance] loadData];

    [self setUpMainView];
    [self createDepartureButton];
    [self createArrivalButton];
    [self createUIimageView];
    [self createSearchButton];
    [self createConstraints];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setUpMainView {
    self.view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.title = @"Air Tickets App";
}

- (void)placeButtonDidTap:(UIButton *)sender {
    PlaceViewController *placeViewController;
    if ([sender isEqual:_departureButton]) {
        placeViewController = [[PlaceViewController alloc] initWithType: PlaceTypeDeparture];
    } else {
        placeViewController = [[PlaceViewController alloc] initWithType: PlaceTypeArrival];
    }
    placeViewController.delegate = self;
    [self.navigationController pushViewController: placeViewController animated:YES];
}

//MARK:- Delegate
- (void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType {
    [self setPlace:place withDataType:dataType andPlaceType:placeType forButton: (placeType == PlaceTypeDeparture) ? _departureButton : _arrivalButton ];
}

- (void)setPlace:(id)place withDataType:(DataSourceType)dataType andPlaceType:(PlaceType)placeType forButton:(UIButton *)button {

    NSString *title;
    NSString *data;

    if (dataType == DataSourceTypeCity) {
        City *city = (City *)place;
        title = city.name;
        data = city.code;
    }
    else if (dataType == DataSourceTypeAirport) {
        Airport *airport = (Airport *)place;
        title = airport.name;
        data = airport.cityCode;
    }

    if (placeType == PlaceTypeDeparture) {
        _searchRequest.origin = data;
    } else {
        _searchRequest.destionation = data;
    }

    [button setTitle:title forState:UIControlStateNormal];
}

//MARK:- SetUp view
- (void)createDepartureButton {
    _departureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_departureButton setTitle:@"From" forState: UIControlStateNormal];
    _departureButton.tintColor = [UIColor whiteColor];
    _arrivalButton.layer.masksToBounds = YES;
    [_departureButton setClipsToBounds:YES];
    [_departureButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:23.0]];
    [_departureButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    _departureButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [_departureButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_departureButton];
}

- (void)createArrivalButton {
    _arrivalButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_arrivalButton setTitle:@"To" forState: UIControlStateNormal];
    [_arrivalButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:23.0]];
    _arrivalButton.tintColor = [UIColor whiteColor];
    _arrivalButton.layer.masksToBounds = YES;
    [_arrivalButton setClipsToBounds:YES];
    [_arrivalButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    _arrivalButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [_arrivalButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_arrivalButton];
}

- (void)createSearchButton {
    _searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [_searchButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:23.0]];
    _searchButton.tintColor = [UIColor whiteColor];
    _searchButton.backgroundColor = [UIColor blackColor];
    _searchButton.layer.masksToBounds = YES;
    [_searchButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    _searchButton.layer.cornerRadius = 8.0;
    _searchButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [_searchButton addTarget:self action:@selector(searchButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataLoadedSuccessfully) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)dataLoadedSuccessfully {
    [[APIManager sharedInstance] cityForCurrentIP:^(City *city) {
        [self setPlace:city withDataType:DataSourceTypeCity andPlaceType:PlaceTypeDeparture forButton:self->_departureButton];
    }];
}


- (void)searchButtonDidTap:(UIButton *)sender {
    [[APIManager sharedInstance] ticketsWithRequest:_searchRequest withCompletion:^(NSArray *tickets) {
        if (tickets.count > 0) {
            TicketsViewController *ticketsViewController = [[TicketsViewController alloc] initWithTickets:tickets];
            [self.navigationController showViewController:ticketsViewController sender:self];
        } else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ohhh!" message:@"No tickets found for this direction" preferredStyle: UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Close" style:(UIAlertActionStyleDefault) handler:nil]];
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }];
}

- (void)createUIimageView {
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.view addSubview:_imageView];
}

- (void)createConstraints {
    [_searchButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0].active = YES;
    [_searchButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-10.0].active = YES;
    [_searchButton.heightAnchor constraintEqualToConstant:80].active = YES;
    [_searchButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0].active = YES;

    [_arrivalButton.bottomAnchor constraintEqualToAnchor:_searchButton.topAnchor constant:-20.0].active = YES;
    [_arrivalButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0].active = YES;
    [_arrivalButton.heightAnchor constraintEqualToConstant:80].active = YES;
    [_arrivalButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0].active = YES;

    [_departureButton.bottomAnchor constraintEqualToAnchor:_arrivalButton.topAnchor constant:-20.0].active = YES;
    [_departureButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0].active = YES;
    [_departureButton.heightAnchor constraintEqualToConstant:80].active = YES;
    [_departureButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0].active = YES;



    [_imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0].active = YES;
    [_imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0].active = YES;
    [_imageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20.0].active = YES;
    [_imageView.heightAnchor constraintEqualToConstant:350].active = YES;
}

-(void)viewDidLayoutSubviews {
    _departureButton.layer.cornerRadius = _departureButton.bounds.size.height / 2;
    _arrivalButton.layer.cornerRadius = _arrivalButton.bounds.size.height / 2;
    _searchButton.layer.cornerRadius = _searchButton.bounds.size.height / 2;
}

@end
