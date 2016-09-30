//
//  FactView.m
//  CatFacts3.0
//
//  Created by Rachel Dorn on 9/29/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "FactView.h"

@implementation FactView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self changeBackgroundColor];
        [self setUpLabelAndButton];
    }
    return self;
}

- (void)changeBackgroundColor {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setUpLabelAndButton {
    self.factLabel = [[UILabel alloc] init];
    self.factLabel.text = @"Placeholder";
    self.factLabel.font = [UIFont systemFontOfSize:30];
    self.factLabel.textColor = [UIColor blackColor];
    self.factLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.factLabel.textAlignment = NSTextAlignmentCenter;
    self.factLabel.numberOfLines = 0;
    self.factLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:self.factLabel];
    
    UIButton *factButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [factButton setTitle:@"Change Fact" forState:UIControlStateNormal];
    factButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:factButton];
    
    NSDictionary *viewsDictionary = @{@"factLabel": self.factLabel, @"factButton": factButton};
    NSArray *vert = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[factLabel]-20-[factButton]-20-|"
                                                            options:0
                                                            metrics:nil
                                                              views:viewsDictionary];
    NSArray *horiz = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[factLabel]-|"
                                                             options:0
                                                             metrics:nil
                                                               views:viewsDictionary];
    NSArray *horiz2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[factButton]-|"
                                                             options:0
                                                             metrics:nil
                                                               views:viewsDictionary];
    [self addConstraints:vert];
    [self addConstraints:horiz];
    [self addConstraints:horiz2];

}


@end
