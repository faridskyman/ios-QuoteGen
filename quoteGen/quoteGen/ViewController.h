//
//  ViewController.h
//  QuoteGen
//
//  Created by eit on 31/8/15.
//  Copyright (c) 2015 eitmobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;

@property (nonatomic, strong) IBOutlet UITextView *quoteText;
- (IBAction)quoteButtonTapped:(id)sender;

@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOptions;

@end

