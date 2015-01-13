//
//  ViewController.m
//  AirPlayStoryboards
//
//  See LICENSE.txt for this sample’s licensing information
//  Created by Dan Zinngrabe on 1/12/15.
//  Copyright (c) 2015 Dan Zinngrabe. All rights reserved.
//

#import "APSBViewController.h"

@interface APSBViewController ()
@property   (nonatomic, weak)   IBOutlet    UILabel *textLabel;
@end

@implementation APSBViewController
@synthesize textLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated {
    __strong UILabel *label = [self textLabel];

    [super viewDidAppear:animated];
    [label setText:[self defaultText]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) defaultText {
    __block NSString    *result        = nil;
    UIScreen            *displayScreen = [[[self view] window] screen];
    
    [[UIScreen screens] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (obj == displayScreen){
            result = [NSString stringWithFormat:@"Screen %ld", (long)idx];
            *stop = YES;
        }
    }];
    
    return result;
}

@end
