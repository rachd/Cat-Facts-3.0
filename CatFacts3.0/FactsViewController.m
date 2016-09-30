//
//  FactsViewController.m
//  CatFacts3.0
//
//  Created by Rachel Dorn on 9/29/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "FactsViewController.h"
#import "FactView.h"

@interface FactsViewController ()

@property (nonatomic, strong) FactView *factView;

@end

@implementation FactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.factView = [[FactView alloc] init];
    self.view = self.factView;
    
    //[self retrieveAllFacts];
}

- (void)viewWillAppear:(BOOL)animated {
    [self retrieveAllFacts];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeFact:(NSString *)fact {
    self.factView.factLabel.text = fact;
}

- (void)retrieveAllFacts {
    [self fetchFacts:^(NSArray *response) {
        [self changeFact:response[0]];
    } failure:^(NSError *error) {
        [self presentAlertWithTitle:@"Error" message:@"Could not retrieve facts. Please check your internet connection and try again"];
    }];
}

- (void)fetchFacts:(void (^)(NSArray *response))success failure:(void(^)(NSError* error))failure {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://catfacts-api.appspot.com/api/facts?number=1"]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (response) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                success([json objectForKey:@"facts"]);
            });
        } else {
            NSArray *blankArray = [[NSArray alloc] initWithObjects:@"Please check your internet connection and try again", nil];
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

@end
