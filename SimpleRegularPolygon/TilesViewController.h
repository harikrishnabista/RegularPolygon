//
//  TilesViewController.h
//  SimpleRegularPolygon
//
//  Created by Bista on 9/23/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonSpinManager.h"
#import "PolygonView.h"

@protocol PolygonSpinManagerDelegate

@required
-(NSArray<PolygonView*>*)getPolygonsForIndexes:(NSArray<NSNumber*>*)indexes;

@end

@interface TilesViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,PolygonSpinManagerDelegate>

@property (readwrite, assign) int MAX_NUMBER_OF_ROWS;
@property (readwrite, assign) int MAX_NUMBER_OF_COLS;

-(NSArray<PolygonView*>*)getPolygonsForIndexes:(NSArray<NSNumber *> *)Indexes;

@end


