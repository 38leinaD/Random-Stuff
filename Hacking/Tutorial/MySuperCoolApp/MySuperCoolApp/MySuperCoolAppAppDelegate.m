//
//  MySuperCoolAppAppDelegate.m
//  MySuperCoolApp
//
//  Created by Daniel Platz on 5/11/11.
//  Copyright 2011 FruitFly. All rights reserved.
//

#import "MySuperCoolAppAppDelegate.h"

@implementation MySuperCoolAppAppDelegate

@synthesize window, label, licensed;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.licensed = NO;
}

- (void)awakeFromNib
{
    [self.label setStringValue:@""];
}

- (IBAction)buttonPressed:(id)sender
{
    if (!self.licensed) {
        [[NSAlert alertWithMessageText:@"Unlicensed version" 
                         defaultButton:@"Ok" 
                       alternateButton:nil 
                           otherButton:nil 
             informativeTextWithFormat:@"You did not license this app, so you miss this cool feature!"]
         runModal];
    }
    else {
        // Hidden feature not available in demo-app
        [self.label setStringValue:@"Hello World"];
    }
}
@end
