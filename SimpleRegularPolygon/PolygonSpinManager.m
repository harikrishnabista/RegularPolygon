//
//  PolygonSpinManager.m
//  SimpleRegularPolygon
//
//  Created by Bista on 9/24/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "PolygonSpinManager.h"

@implementation PolygonSpinManager

-(void)spinPolygonAlongWithNeighbour:(int)selectedIndex withDelegate:(UIViewController*)delegate{
    
    TilesViewController * tilesViewCon = (TilesViewController*)delegate;
    
    int matrix[tilesViewCon.MAX_NUMBER_OF_ROWS][tilesViewCon.MAX_NUMBER_OF_COLS];
    
    
    // converting one dimensional to two dimension to find exact neighbour as they aare displayed in the two-D collectionView
    
    int count = 0;
    for (int i=0; i<tilesViewCon.MAX_NUMBER_OF_ROWS; i++) {
        for (int j=0; j<tilesViewCon.MAX_NUMBER_OF_COLS; j++) {
            matrix[i][j] = count;
            count = count + 1;
        }
    }
    
    int row = selectedIndex/tilesViewCon.MAX_NUMBER_OF_COLS;
    int col = selectedIndex%tilesViewCon.MAX_NUMBER_OF_COLS;
    
    NSMutableArray* indexesToRotate = [[NSMutableArray alloc] init];
    
    NSNumber* middle = [NSNumber numberWithInt:matrix[row][col]];
    [indexesToRotate addObject:middle];
    
    // protecting overflow for corner selected item
    if(row-1 >= 0){
        NSNumber* top = [NSNumber numberWithInt:matrix[row-1][col]];
        [indexesToRotate addObject:top];
    }
    
    if(col-1 >= 0){
        NSNumber* left = [NSNumber numberWithInt:matrix[row][col-1]];
        [indexesToRotate addObject:left];
    }
    
    if(col+1 < tilesViewCon.MAX_NUMBER_OF_COLS){
        NSNumber* right = [NSNumber numberWithInt:matrix[row][col+1]];
        [indexesToRotate addObject:right];
    }
    
    if(row+1 < tilesViewCon.MAX_NUMBER_OF_ROWS){
        NSNumber* bottom = [NSNumber numberWithInt:matrix[row+1][col]];
        [indexesToRotate addObject:bottom];
    }
    
    // getting all the corresponding Polygons from collectionview
    NSArray* polygons = [tilesViewCon getPolygonsForIndexes:indexesToRotate];
    
    for (PolygonView *pv in polygons) {
        [pv spin];
    }
}

@end
