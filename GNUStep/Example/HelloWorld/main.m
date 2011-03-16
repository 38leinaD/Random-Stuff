#include <AppKit/AppKit.h>

int main(int argc, const char *argv[]) 
{
	NSLog(@"main called");
	
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	int ret = NSApplicationMain(argc, argv);
    [pool release];

	return ret;
}