//
//  FactView.h
//  CatFacts3.0
//
//  Created by Rachel Dorn on 9/29/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FactViewDelegate <NSObject>

@required
-(void)buttonClicked;

@end

@interface FactView : UIView

@property (nonatomic, strong) UILabel *factLabel;
@property (nonatomic, weak) id <FactViewDelegate> delegate;

@end
