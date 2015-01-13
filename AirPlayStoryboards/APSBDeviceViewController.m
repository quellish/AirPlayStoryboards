//
//  APSBDeviceViewController.m
//  AirPlayStoryboards
//
//  See LICENSE.txt for this sample’s licensing information
//  Created by Dan Zinngrabe on 1/12/15.
//  Copyright (c) 2015 Dan Zinngrabe. All rights reserved.
//

#import "APSBDeviceViewController.h"
@import AudioToolbox;

@interface APSBDeviceViewController ()
@property (nonatomic, weak) IBOutlet    UIButton    *button;
@end

@implementation APSBDeviceViewController
@synthesize button;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTouchButton:(id)sender {
    if (sender == [self button]){
        AudioServicesPlaySystemSound(1103);
    }
}

@end
