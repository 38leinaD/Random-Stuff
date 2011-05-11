//
//  MySuperCoolAppAppDelegate.h
//  MySuperCoolApp
//
//  Created by Daniel Platz on 5/11/11.
//  Copyright 2011 FruitFly. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MySuperCoolAppAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    NSTextField *label;
    BOOL licensed;
}

@property (assign) IBOutlet NSWindow *window;
@property (retain, nonatomic) IBOutlet NSTextField *label;
@property (assign, nonatomic, getter = isLicensed) BOOL licensed;

- (IBAction)buttonPressed:(id)sender;
@end
