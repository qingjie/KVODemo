//
//  ViewController.m
//  KVODemo
//
//  Created by qingjie on 10/2/15.
//  Copyright © 2015 qingjie. All rights reserved.
//

#import "ViewController.h"
#import "StockData.h"

@interface ViewController ()

@end

@implementation ViewController

StockData *stockDataKVO = nil;
UILabel *lblText = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    stockDataKVO = [StockData new];
    
    
    [stockDataKVO setValue:@"qingjie" forKey:@"stockName"];
    [stockDataKVO setValue:@"10.0" forKey:@"price"];
    
    [stockDataKVO addObserver:self forKeyPath:@"price" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionPrior context:NULL];
    
    lblText = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    lblText.textColor = [UIColor redColor];
    
    lblText.backgroundColor = [UIColor lightGrayColor];
    lblText.text = [stockDataKVO valueForKey:@"price"];
    [self.view addSubview:lblText];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake(100, 200, 100, 30);
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"price"]) {
        lblText.text = [stockDataKVO valueForKey:@"price"];
        
        NSLog(@"before change, price is ,%@",lblText.text);
        
        if ([change[NSKeyValueChangeNotificationIsPriorKey] boolValue]) {
            NSLog(@"before change, price is ,%@",lblText.text);
        
        } else {
            
            NSLog(@"after change price is ,%@",lblText.text);
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) btnTapped {
     //NSLog(@"clicked");
   
    [stockDataKVO setValue:@"20.0" forKey:@"price"];
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
   
}

-(void)dealloc{
    [stockDataKVO removeObserver:self forKeyPath:@"price"];
    
}

@end
