//
//  TilesViewController.m
//  SimpleRegularPolygon
//
//  Created by Bista on 9/23/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "TilesViewController.h"
#import "PolygonView.h"

@interface TilesViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TilesViewController

@synthesize MAX_NUMBER_OF_ROWS = _MAX_NUMBER_OF_ROWS;
@synthesize MAX_NUMBER_OF_COLS = _MAX_NUMBER_OF_COLS;

//delegate method for PolygonSpinManagerDelegate
// this method provides all the neighbour polygons from CollectionView
-(NSArray<PolygonView*>*)getPolygonsForIndexes:(NSArray<NSNumber *> *)indexes {
    NSMutableArray<PolygonView*>* polygons = [[NSMutableArray alloc] init];
    
    for (NSNumber* index in indexes) {
        NSIndexPath * ip = [NSIndexPath indexPathForRow:[index integerValue] inSection:0];
        UICollectionViewCell * cell = [self.collectionView cellForItemAtIndexPath:ip];
        PolygonView *pv = (PolygonView*)[cell viewWithTag:100];
        
        if(pv != nil){
            [polygons addObject:pv];
        }
    }
    
    return polygons;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _MAX_NUMBER_OF_COLS = 8;
    int widthOfAPolygon = self.view.frame.size.width/_MAX_NUMBER_OF_COLS;
    _MAX_NUMBER_OF_ROWS = self.view.frame.size.height/widthOfAPolygon;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _MAX_NUMBER_OF_ROWS*_MAX_NUMBER_OF_COLS;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    PolygonView *polygonView = (PolygonView*)[cell viewWithTag:100];

    polygonView.fillColor = [self getRandomColor];
    polygonView.borderColor = [self getRandomColor];
    polygonView.sides = [self randomNumberBetween:3 maxNumber:10];
    polygonView.angle = 90.0;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    float height = self.view.frame.size.width/_MAX_NUMBER_OF_COLS;
    return CGSizeMake(height, height);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PolygonSpinManager *psm = [[PolygonSpinManager alloc] init];
    [psm spinPolygonAlongWithNeighbour:(int)indexPath.row withDelegate:self];
}

-(UIColor *)getRandomColor {
    return [self getColorWithIndex:[self randomNumberBetween:0 maxNumber:7]];
}

-(UIColor *)getColorWithIndex:(NSInteger)colIndex {
    
    switch (colIndex) {
        case 0:
            return UIColor.redColor;
            break;
        case 1:
            return UIColor.greenColor;
            break;
        case 2:
            return UIColor.blueColor;
            break;
        case 3:
            return UIColor.purpleColor;
            break;
        case 4:
            return UIColor.grayColor;
            break;
        case 5:
            return UIColor.cyanColor;
            break;
        case 6:
            return UIColor.magentaColor;
            break;
        case 7:
            return UIColor.orangeColor;
            break;
            
        default: return UIColor.redColor;
            
    }
}

- (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max{
    return min + arc4random_uniform((uint32_t)(max - min + 1));
}


@end
