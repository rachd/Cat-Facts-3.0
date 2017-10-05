//
//  FactsViewController.m
//  CatFacts3.0
//
//  Created by Rachel Dorn on 9/29/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "FactsViewController.h"
#import "FactView.h"

@interface FactsViewController () <FactViewDelegate>

@property (nonatomic, strong) FactView *factView;

@end

@implementation FactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.factView = [[FactView alloc] initWithFrame:self.view.frame];
    self.factView.delegate = self;
    self.view = self.factView;
    
    //[self retrieveAllFacts];
}

- (void)viewWillAppear:(BOOL)animated {
    [self retrieveFact];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeFact:(NSString *)fact {
    self.factView.factLabel.text = fact;
}

- (void)retrieveFact {
    [self fetchFacts:^(NSString *response) {
        [self changeFact:response];
        [self.factView changeBackgroundColor];
    } failure:^(NSError *error) {
        [self presentAlertWithTitle:@"Error" message:@"Could not retrieve facts. Please check your internet connection and try again"];
    }];
}

- (void)fetchFacts:(void (^)(NSString *response))success failure:(void(^)(NSError* error))failure {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://catfact.ninja/fact"]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (response) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                success([json objectForKey:@"fact"]);
            });
        } else {
            NSString *blankArray = @"Please check your internet connection and try again";
            success(blankArray);
        }
    }];
    [dataTask resume];
}

- (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title                                                                       message:message preferredStyle:UIAlertControllerStyleAlert];
        
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:nil];
        
    [alert addAction:dismissAction];
        
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark FaceViewDelegate methods

- (void)buttonClicked {
    [self retrieveFact];
}


@end
