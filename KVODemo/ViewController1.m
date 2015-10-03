//
//  ViewController1.m
//  KVODemo
//
//  Created by qingjie on 10/2/15.
//  Copyright © 2015 qingjie. All rights reserved.
//

#import "ViewController1.h"
#import "HYBStudent.h"

@interface ViewController1 ()

@property (nonatomic, strong) HYBStudent *student;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.student = [HYBStudent new];
    self.student.studentName = @"qingjie";
    self.student.grade = 90.f;
    
    [self.student addObserver:self forKeyPath:@"grade" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:nil];
    [self performSelector:@selector(changeGrade) withObject:nil afterDelay:4.0];
    
     
}

-(void) changeGrade {
    self.student.grade = 100.0f;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if([keyPath isEqualToString:@"grade"]){
        NSLog(@"student %@'s grade is %f'",self.student.studentName,self.student.grade);
    }
}

-(void)dealloc {
    
    [self.student removeObserver:self forKeyPath:@"grade" context:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
