//
//  FactView.m
//  CatFacts3.0
//
//  Created by Rachel Dorn on 9/29/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "FactView.h"

@implementation FactView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self changeBackgroundColor];
        [self setUpLabelAndButton];
    }
    return self;
}

- (void)changeBackgroundColor {
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.backgroundColor = randomColor;
}

- (void)buttonClicked {
    [self changeBackgroundColor];
    [self.delegate buttonClicked];
}

- (void)setUpLabelAndButton {
    self.factLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 100)];
    self.factLabel.text = @"";
    self.factLabel.font = [UIFont systemFontOfSize:30];
    self.factLabel.textColor = [UIColor whiteColor];
    self.factLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.factLabel.textAlignment = NSTextAlignmentCenter;
    self.factLabel.numberOfLines = 30;
    self.factLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.factLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.factLabel];
    
    UIButton *factButton = [UIButton buttonWithType:UIButtonTypeCustom];
    factButton.frame = CGRectMake(20, self.frame.size.height - 60, self.frame.size.width - 40, 40);
    [factButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    factButton.backgroundColor = [UIColor whiteColor];
    factButton.layer.cornerRadius = 6.0;
    [factButton setTitle:@"Change Fact" forState:UIControlStateNormal];
    factButton.translatesAutoresizingMaskIntoConstraints = NO;
    [factButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:factButton];
    
  //  NSDictionary *viewsDictionary = @{@"factLabel": self.factLabel, @"factButton": factButton};
  //  NSArray *vert = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[factLabel]-20-[factButton(==40)]-20-|"
  //                                                          options:0
  //                                                          metrics:nil
  //                                                            views:viewsDictionary];
  //  NSArray *horiz = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[factLabel]-|"
  //                                                           options:0
  //                                                           metrics:nil
 //                                                              views:viewsDictionary];
  //  NSArray *horiz2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[factButton]-|"
 //                                                            options:0
 //                                                            metrics:nil
 //                                                              views:viewsDictionary];
  //  [self addConstraints:vert];
 //   [self addConstraints:horiz];
  //  [self addConstraints:horiz2];

}


@end
