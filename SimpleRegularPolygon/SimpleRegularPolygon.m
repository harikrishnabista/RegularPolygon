//
//  SimpleRegularPolygon.m
//  SimpleRegularPolygon
//
//  Created by Hari K Bista on 9/22/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "SimpleRegularPolygon.h"

@implementation SimpleRegularPolygon

@synthesize sides = _sides;
@synthesize radius = _radius;
@synthesize initialVertex = _initialVertex;

- (instancetype)init{
    self = [super init];
    if (self) {
        _radius = 50;
        _sides = 3;
        
    }
    return self;
}

-(double)getAngleBetweenTwoVertices{
    return 360/_sides;
}

-(void)setSides:(NSUInteger)sides error:(NSError **)error {
    if (sides > 25 || sides < 3) {
        *error = [NSError errorWithDomain:@"com.davedelong.myproject" code:42 userInfo:nil];
    }
}

-(NSArray*)generatePolygonVerticesWithAngle:(float)angle {
    
    _initialVertex = CGPointMake(0, _radius);
    CGPoint rotatedInitVertex = [self getRotatedPointOf:_initialVertex byAngle:angle];
    
    NSMutableArray *polygonVertices = [[NSMutableArray alloc] init];
    for (int i=0; i<_sides; i++) {
        CGPoint nextPoint = [self getRotatedPointOf:rotatedInitVertex byAngle:self.getAngleBetweenTwoVertices*i];
        
        //shifting all the vertices to center (radius,radius)
        nextPoint = CGPointMake(nextPoint.x + _radius, nextPoint.y + _radius);
        [polygonVertices addObject:[NSValue valueWithCGPoint:nextPoint]];
    }
    
    return polygonVertices;
}

-(CGPathRef)getPathForPolygonWithAngle:(float)angle{
    
    NSArray *polygonVertices = [self generatePolygonVerticesWithAngle:angle];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //setting initial point to draw path using vertices
    CGPoint startingVertex = [(NSValue *)[polygonVertices objectAtIndex:0] CGPointValue];
    [path moveToPoint:startingVertex];
    
    for (NSObject *vertexObj in polygonVertices) {
        CGPoint vertex = [(NSValue *)vertexObj CGPointValue];
        [path addLineToPoint:vertex];
    }
    
    [path closePath];
    return path.CGPath;
}

// coordinate rotation mathematical formula
- (CGPoint)getRotatedPointOf:(CGPoint)point byAngle:(double)angleDegree {
    double angleRad = angleDegree / 180 * M_PI;
    double newX = point.x*cos(angleRad) - point.y*sin(angleRad);
    double newY = point.y*cos(angleRad) + point.x*sin(angleRad);
    return CGPointMake(newX, newY);
}

@end
