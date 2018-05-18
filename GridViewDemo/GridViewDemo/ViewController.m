//
//  ViewController.m
//  GridViewDemo
//
//  Created by 啊育 on 2018/5/16.
//  Copyright © 2018年 Helloworld. All rights reserved.
//

#import "ViewController.h"
#import "MLHGridView.h"

@interface ViewController ()<MLHGridViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MLHGridView *grid = [[MLHGridView alloc]initWithFrame:CGRectMake(10, 64, self.view.frame.size.width-20, CGRectGetHeight(self.view.bounds) - 64)];
    grid.delegate = self;
    grid.scrollEnabled = YES;
    [self.view addSubview:grid];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 // MARK: - MLHGridViewDelegate
 
 - (NSInteger)numberOfColumnsForGridView:(MLHGridView *)gridView row:(NSInteger)row{
     return 4;
 }
 
 -(NSInteger)numberOfRowsForGridView:(MLHGridView *)gridView{
     return 100;
 }
 
 ///一行的数据
 -(NSArray *)gridView:(MLHGridView *)gridView dataForRow:(NSInteger)row{
     if(row == 0){
         return @[@"开始时间",@"医嘱名称",@"一次计量",@"药品用法"];
     }else if(row== 2 ||row==3){
         return @[@"2018-04",@"碳注射液",@"250ml",@"注射"];
     }else{
         return @[@"2018-04-20 到 2018-12-20",@"碳酸经钠注射液",@"250ml",@"注射"];
     }
 
 }
 
 
 ///行高
 -(CGFloat)gridView:(MLHGridView *)gridView heightForRow:(NSInteger)row{
     if(row == 0){
         return 30.0;
     }
     else{
         return [gridView rowHeight:row];
     }
 }
 
 ///行的背景颜色
 -(UIColor *)gridView:(MLHGridView *)gridView backgroundColorForRow:(NSInteger)row{
     if (row == 0) {
         return HEXCOLOR(0xe7e7e7);
     }else{
         return UIColor.whiteColor;
     }
 }
 
 -(UIColor *)gridView:(MLHGridView *)gridView textColorForRow:(NSInteger)row{
     if(row == 0){
         return HEXCOLOR(0x999999);
     }else{
         return HEXCOLOR(0x333333);
     }
 }
 
 -(UIColor *)gridView:(MLHGridView *)gridView verticalSeparatorColorForRow:(NSInteger)row{
//     if (row == 0) {
//         return UIColor.whiteColor;
//     }
     return nil;
 }



@end
