//
//  SimpleRegularPolygon.h
//  SimpleRegularPolygon
//
//  Created by Bista on 9/22/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SimpleRegularPolygon : NSObject

@property (readwrite, assign) NSUInteger sides;
@property (readwrite, assign) double radius;
@property (nonatomic, assign) CGPoint initialVertex;

-(double)getAngleBetweenTwoVertices;
-(CGPathRef)getPathForPolygonWithAngle:(float)angle;
-(void)setSides:(NSUInteger)sides error:(NSError **)error;

@end
