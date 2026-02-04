//
//  AppDelegate.m
//  Neko
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	// Create status bar item
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
	[statusItem retain];

	// Load the cat image for the menu bar
	NSBundle *bundle = [NSBundle mainBundle];
	NSImage *icon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"mati2" ofType:@"gif"]];

	// Resize to appropriate menu bar size (18x18 is standard)
	NSImage *resizedIcon = [[NSImage alloc] initWithSize:NSMakeSize(18, 18)];
	[resizedIcon lockFocus];
	[[NSGraphicsContext currentContext] setImageInterpolation:NSImageInterpolationHigh];
	[icon drawInRect:NSMakeRect(0, 0, 18, 18)
			fromRect:NSMakeRect(0, 0, icon.size.width, icon.size.height)
		   operation:NSCompositingOperationSourceOver
			fraction:1.0];
	[resizedIcon unlockFocus];

	// Set as template so it adapts to light/dark mode
	[resizedIcon setTemplate:YES];

	// Configure the status item button
	statusItem.button.image = resizedIcon;
	statusItem.button.toolTip = @"Neko";

	// Create the menu
	NSMenu *menu = [[NSMenu alloc] init];

	NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:@"Quit Neko"
													  action:@selector(quitApp:)
											   keyEquivalent:@"q"];
	[quitItem setTarget:self];
	[menu addItem:quitItem];

	statusItem.menu = menu;
}

- (IBAction)quitApp:(id)sender
{
	[NSApp terminate:self];
}

- (void)dealloc
{
	[statusItem release];
	[super dealloc];
}

@end
