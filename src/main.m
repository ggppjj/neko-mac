//
//  main.m
//  猫
//
//  Created by Matthew Donoughe on 2007-09-23.
//  Copyright __MyCompanyName__ 2007. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
		NSApplication *app = [NSApplication sharedApplication];

		// Create and set the app delegate
		AppDelegate *delegate = [[AppDelegate alloc] init];
		[app setDelegate:delegate];

		// Load the main nib
		[[NSBundle mainBundle] loadNibNamed:@"MainMenu" owner:app topLevelObjects:nil];

		// Run the app
		[app run];
	}
	return 0;
}
