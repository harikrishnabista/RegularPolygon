//
//  PolygonView.m
//  SimpleRegularPolygon
//
//  Created by Hari K Bista on 9/23/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "PolygonView.h"
#import "SimpleRegularPolygon.h"

@implementation PolygonView

@synthesize radius = _radius;
@synthesize initialVertex = _initialVertex;
@synthesize spinCounter = _spinCounter;

@synthesize sides = _sides;
@synthesize borderColor = _borderColor;
@synthesize fillColor = _fillColor;
@synthesize angle = _angle;


-(void)drawRect:(CGRect)rect {
    
    self.layer.sublayers = nil;
    
    SimpleRegularPolygon *polygon =  [[SimpleRegularPolygon alloc] init];
    polygon.radius = self.frame.size.height/2;
    polygon.sides = _sides;
    
    CGPathRef path = [polygon getPathForPolygonWithAngle:_angle];
    CAShapeLayer *polygonShapeLayer = [CAShapeLayer layer];
    
    polygonShapeLayer.path = path;
    
    polygonShapeLayer.strokeColor = _borderColor.CGColor;
    polygonShapeLayer.fillColor = _fillColor.CGColor;
    
    [self.layer addSublayer:polygonShapeLayer];
}

// rotates for 10 rounds
- (void)spinWithOptions:(UIViewAnimationOptions)options {
    [UIView animateWithDuration:0.25
                          delay:0
                        options:options
                     animations:^{
                         self.transform = CGAffineTransformRotate(self.transform, M_PI / 2);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             if (_spinCounter < 10) {
                                 _spinCounter = _spinCounter + 1;
                                 [self spinWithOptions: UIViewAnimationOptionCurveLinear];
                             } else {
                                 _spinCounter = 0;
                             }
                         }
                     }];
}

- (void)spin {
    if (_spinCounter == 0) {
        [self spinWithOptions: UIViewAnimationOptionCurveEaseIn];
    }
}

- (void)stopSpin {
    _spinCounter = 0;
}

@end
