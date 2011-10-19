//
//  GLKitAndBlenderViewController.m
//  GLKitAndBlender
//
//  Created by Daniel Platz on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GLKitAndBlenderViewController.h"

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
    
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}

#pragma mark GLKViewControllerDelegate

- (void)glkViewControllerUpdate:(GLKViewController *)controller
{
    static float transY = 0.0f;
    float y = sinf(transY)/2.0f;
    transY += 0.175f;
    
    GLKMatrix4 modelview = GLKMatrix4MakeTranslation(0, y, -5.0f);
    effect.transform.modelviewMatrix = modelview;
    
    GLfloat ratio = self.view.bounds.size.width/self.view.bounds.size.height;
    GLKMatrix4 projection = GLKMatrix4MakePerspective(45.0f, ratio, 0.1f, 20.0f);
    effect.transform.projectionMatrix = projection;
}

#pragma mark GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{  
    [effect prepareToDraw];
    
    static const GLfloat squareVertices[] = {
        -0.5f, -0.5f, 1,
        0.5f, -0.5f, 1,
        -0.5f,  0.5f, 1,
        0.5f,  0.5f, 1
    };

    static const GLubyte squareColors[] = {
        255, 255,   0, 255,
        0,   255, 255, 255,
        0,     0,   0,   0,
        255,   0, 255, 255,
    };
    
    glClear(GL_COLOR_BUFFER_BIT);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribColor);
     
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, squareVertices);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_UNSIGNED_BYTE, GL_TRUE, 0, squareColors);
     
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
     
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisableVertexAttribArray(GLKVertexAttribColor);
}

@end
