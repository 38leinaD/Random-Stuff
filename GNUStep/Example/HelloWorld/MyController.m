/* All Rights reserved */

#include <AppKit/AppKit.h>
#include "MyController.h"

@implementation MyController

- (void)awakeFromNib;
{
	NSLog(@"awakeFromNib called");
	NSLog(@"outLabel = %@", outLabel);
	[outLabel setStringValue:@""];
}

- (void) helloWorldAction: (id)sender
{
	NSLog(@"helloWorldAction called");
	[outLabel setStringValue:@"Hello World"];
}

@end