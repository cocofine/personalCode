//
//  ViewController.m
//  OuStarRateView
//
//  Created by ouyangqi on 2019/4/9.
//  Copyright © 2019年 ouyangqi. All rights reserved.
//

#import "ViewController.h"
#import "OuStarsView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *starView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.starView.rate = 0.75;
    
    OuStarsView *view = [[OuStarsView alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
    view.allowMark = YES;
    [self.view addSubview:view];
    view.rate = 0.3;
}


@end
