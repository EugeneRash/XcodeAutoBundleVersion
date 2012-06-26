//
//  ViewController.m
//  XcodeAutoBundleVersion
//
//  Created by Evgeniy Shurakov on 26.06.12.
//  Copyright (c) 2012 Evgeniy Shurakov. All rights reserved.
//

#import "ViewController.h"
#import "Version.h"

@interface ViewController ()
@property (nonatomic, strong) IBOutlet UILabel *versionLabel;
@end

@implementation ViewController

@synthesize versionLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *v1 = [bundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
	NSString *v2 = [bundle objectForInfoDictionaryKey:@"CFBundleVersion"];
	NSString *v3 = @"";
	
#ifdef BUILD_HASH
	v3 = BUILD_HASH;
#endif
	
	self.versionLabel.text = [NSString stringWithFormat:@"%@ (%@/%@)", v1, v2, v3];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
	self.versionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
