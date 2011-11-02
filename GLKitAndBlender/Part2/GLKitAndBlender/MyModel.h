//
//  MyModel.h
//  GLKitAndBlender
//
//  Created by Daniel Platz on 10/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

- (id)initWithFilename:(NSString *)filepath;
- (BOOL)load;
- (void)render;

@end
