//
//  PolygonSpinManager.h
//  SimpleRegularPolygon
//
//  Created by Bista on 9/24/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TilesViewController.h"
#import "PolygonView.h"

@interface PolygonSpinManager : NSObject

-(void)spinPolygonAlongWithNeighbour:(int)selectedIndex withDelegate:(UIViewController*)delegate;

@end

