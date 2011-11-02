//
//  MyModel.m
//  GLKitAndBlender
//
//  Created by Daniel Platz on 10/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyModel.h"

#import <GLKit/GLKit.h>

@interface MyModel () {
@private
    NSUInteger _num_vertices;
    GLfloat *_vertices;
    
    NSString *_filepath;
}
@end

@implementation MyModel

- (id)initWithFilename:(NSString *)filepath
{
    self = [super init];
    if (self) {
        _filepath = filepath;
    }
    
    return self;
}

- (BOOL)load
{
    NSString *file_content = [NSString stringWithContentsOfFile:_filepath encoding:NSUTF8StringEncoding error:nil];
    NSArray *coordinates = [file_content componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n\t"]];
    _num_vertices = [coordinates count] / 3;
    _vertices = malloc(sizeof(GLfloat) * 3 * _num_vertices);
    
    NSLog(@"Number of vertices to load: %d", _num_vertices);
    
    int i=0;
    for (NSString *coordinate in coordinates) {
        _vertices[i++] = atof([coordinate cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    NSLog(@"Model loaded");
    
    return YES;
}

- (void)render
{
    static const float color[] = {
        0.8f, 0.8f, 0.8f, 1.0f
    };
    
    glVertexAttrib4fv(GLKVertexAttribColor, color);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, _vertices);
     
    glDrawArrays(GL_TRIANGLES, 0, _num_vertices);

    glDisableVertexAttribArray(GLKVertexAttribPosition);
}

- (void)dealloc
{
    free(_vertices);
}

@end
