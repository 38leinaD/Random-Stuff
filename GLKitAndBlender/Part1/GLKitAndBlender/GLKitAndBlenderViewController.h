//
//  GLKitAndBlenderViewController.h
//  GLKitAndBlender
//
//  Created by Daniel Platz on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface GLKitAndBlenderViewController : GLKViewController <GLKViewControllerDelegate, GLKViewDelegate> {
@private
    GLKBaseEffect *effect;
}

#pragma mark GLKViewControllerDelegate
- (void)glkViewControllerUpdate:(GLKViewController *)controller;

#pragma mark GLKViewDelegate
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect;

@end
