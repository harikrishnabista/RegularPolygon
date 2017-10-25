//
//  PolygonView.h
//  SimpleRegularPolygon
//
//  Created by Bista on 9/23/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface PolygonView : UIView

@property (readwrite, assign) double radius;
//@property (readwrite, assign) Boolean animating;

@property (readwrite, assign) int spinCounter;

@property (nonatomic, assign) CGPoint initialVertex;

@property (nonatomic) IBInspectable double angle;
@property (nonatomic) IBInspectable NSUInteger sides;
@property (nonatomic) IBInspectable UIColor* borderColor;
@property (nonatomic) IBInspectable UIColor* fillColor;

-(void)spin;

@end
