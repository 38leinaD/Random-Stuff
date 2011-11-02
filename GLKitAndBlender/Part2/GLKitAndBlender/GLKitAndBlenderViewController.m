//
//  GLKitAndBlenderViewController.m
//  GLKitAndBlender
//
//  Created by Daniel Platz on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GLKitAndBlenderViewController.h"

#import "MyModel.h"

@implementation GLKitAndBlenderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    EAGLContext *aContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    GLKView *glkView = (GLKView *)self.view;
    glkView.delegate = self;
    glkView.context = aContext;
    
    glkView.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    glkView.drawableDepthFormat = GLKViewDrawableDepthFormat16;
    glkView.drawableMultisample = GLKViewDrawableMultisample4X;
    
    self.delegate = self;
    self.preferredFramesPerSecond = 30;
        
    effect = [[GLKBaseEffect alloc] init];
    
    // Load the model
    model = [[MyModel alloc] initWithFilename:[[NSBundle mainBundle] pathForResource:@"mymodel" ofType:@"mdl"]];
    [model load];
    
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glEnable(GL_DEPTH_TEST);
}

#pragma mark GLKViewControllerDelegate

- (void)glkViewControllerUpdate:(GLKViewController *)controller
{
    static float transY = 0.0f;
    transY += 0.175f;
    
    static float deg = 0.0;
    deg += 0.1;
    if (deg >= 2*M_PI) {
        deg-=2*M_PI;
    }
    
    static GLKMatrix4 modelview;
    modelview = GLKMatrix4Translate(GLKMatrix4Identity, 0, 0, -25.0f);
    modelview = GLKMatrix4Rotate(modelview, deg, 0.0f, 1.0f, 0.0f);
    
    // Correction for loaded model because in blender z-axis is facing upwards
    modelview = GLKMatrix4Rotate(modelview, -M_PI/2.0f, 0.0f, 1.0f, 0.0f);
    modelview = GLKMatrix4Rotate(modelview, -M_PI/2.0f, 1.0f, 0.0f, 0.0f);
    
    effect.transform.modelviewMatrix = modelview;
    
    static GLKMatrix4 projection;
    GLfloat ratio = self.view.bounds.size.width/self.view.bounds.size.height;
    projection = GLKMatrix4MakePerspective(45.0f, ratio, 0.1f, 100.0f);
    effect.transform.projectionMatrix = projection;}

#pragma mark GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{  
    [effect prepareToDraw];
    
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    // Render the model
    [model render];
}

@end
