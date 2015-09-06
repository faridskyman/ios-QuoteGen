//
//  ViewController.m
//  QuoteGen
//
//  Created by eit on 31/8/15.
//  Copyright (c) 2015 eitmobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myQuotes =@[
                     @"live and let live",
                     @"Don't cry over spilt milk",
                     @"Always look on the bright side of life",
                     @"Nobody's perfect",
                     @"Can't see the woods for the trees",
                     @"Better to have loved and lost then not loved at all",
                     @"The early bird catches the worm",
                     @"As slow as a wet week"
                     
                     ];
    
    //reset textbox
    self.quoteText.text = @"Welcome to Quote, Click on button for a Quote.";
    
    
    //add xml quotes.plist
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType: @"plist" ];
    self.movieQuotes= [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)quoteButtonTapped:(id)sender{
    //1. get personal quotes when final segment is selected
    
    NSString *selectedCategoty = @"";
    
    if (self.quoteOptions.selectedSegmentIndex == 2)
    {
        NSUInteger arr_tot = [self.myQuotes count];
        
        
        //2. get random index
        int index = (arc4random() % arr_tot);
      
        //3
        NSString *my_quote = self.myQuotes[index];
        
        self.quoteText.text = [NSString stringWithFormat:@"Quote: \n\n%@", my_quote];
        
    }
    else
    {
        if(self.quoteOptions.selectedSegmentIndex == 1)
        {
            selectedCategoty = @"modern";
        }
        else
        {
            selectedCategoty = @"classic";
        }
        
        
        //filter using predicates
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category ==%@", selectedCategoty];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
    
    
    //1. get rows in array
    NSUInteger arr_tot = [filteredArray count];
    
     if(arr_tot > 0)
     {
         //2. get random index
         int index = (arc4random() % arr_tot);
         
         //3. get quote
         //
         NSString *my_quote = self.movieQuotes[index][@"quote"];
         NSString *from_movie = self.movieQuotes[index][@"source"];
         
         self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n'%@'\n\n-%@", my_quote, from_movie];
         
     }
        else
        {
            self.quoteText.text = [NSString stringWithFormat:@"No quote to display"];
        }
        
        
    
    }
}

@end
