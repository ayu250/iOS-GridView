//
//  MLHDataGridView.h
//  DemoMLH
//
//  Created by 啊育 on 2018/5/7.
//  Copyright © 2018年 Helloworld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLHGridViewHeader.h"

@protocol MLHGridViewDataSource;

@interface MLHGridView : UIView

@property(nonatomic,weak) id<MLHGridViewDataSource> delegate;
@property(nonatomic,assign) BOOL scrollEnabled;

-(CGFloat)rowHeight:(NSInteger)row;
-(CGFloat)rowHeightInRect:(CGRect)rect atRow:(NSInteger)row;
-(void)reloadData;

@end




@protocol MLHGridViewDataSource <NSObject>

-(NSInteger)numberOfRowsForGridView:(MLHGridView *)gridView;

-(NSInteger)numberOfColumnsForGridView:(MLHGridView *)gridView row:(NSInteger)row;

-(NSArray *)gridView:(MLHGridView *)gridView dataForRow:(NSInteger)row;

@optional

-(CGFloat)gridView:(MLHGridView *)gridView heightForRow:(NSInteger)row;

-(UIColor *)gridView:(MLHGridView *)gridView backgroundColorForRow:(NSInteger)row;

-(UIColor *)gridView:(MLHGridView *)gridView textColorForRow:(NSInteger)row column:(NSInteger)column;

-(UIColor *)gridView:(MLHGridView *)gridView verticalSeparatorColorForRow:(NSInteger)row column:(NSInteger)column;

-(UIImage *)gridView:(MLHGridView *)gridView flagImageForRow:(NSInteger)row column:(NSInteger)column;

@end
