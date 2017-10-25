//
//  ViewController.m
//  SimpleRegularPolygon
//
//  Created by Bista on 9/21/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "ViewController.h"
#import "SimpleRegularPolygon.h"
#import "PolygonView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *WidthOfPolygonContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeightOfPolygonContainer;

@property (weak, nonatomic) IBOutlet UILabel *lblSIdes;
@property (weak, nonatomic) IBOutlet UISlider *sliderSides;

@property (strong, nonatomic) SimpleRegularPolygon *polygon;
@property (weak, nonatomic) IBOutlet PolygonView *polygonView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lblSIdes.text = [NSString stringWithFormat:@"Sides: %lu", (unsigned long)self.polygonView.sides];

}

- (IBAction)sliderSidesValueChanged:(UISlider*)sender {
    int numSides = (int)floor(sender.value);
    _lblSIdes.text = [NSString stringWithFormat:@"Sides: %d", numSides];
    
    if(self.polygonView.sides != numSides){
        self.polygonView.sides = numSides;
        [self.polygonView setNeedsDisplay];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
